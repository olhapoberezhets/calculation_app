import 'dart:convert';
import 'package:calculation_app/models/coordinates_mode/coordinates_model.dart';
import 'package:calculation_app/models/data_model/data_model.dart';
import 'package:calculation_app/models/result_model/result_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<List<DataModel?>> fetchData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        if (jsonData["data"] != null && jsonData["data"].isNotEmpty) {
          return jsonData["data"].map<DataModel?>((dataItem) {
            return DataModel(
              id: dataItem["id"],
              field: List<String>.from(dataItem["field"]),
              start: CoordinatesModel.fromJson(dataItem["start"]),
              end: CoordinatesModel.fromJson(dataItem["end"]),
            );
          }).toList();
        }
      } else {
        print('Error: Server returned status code ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return [];
  }

  Future<void> postData(String url, List<ResultModel?> results) async {
    try {
      final jsonData =
          results.where((e) => e != null).map((e) => e!.toJson()).toList();

      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(jsonData),
      );

      if (response.statusCode == 200) {
        print('Data posted successfully');
      } else {
        print('Error: Server returned status code ${response.statusCode}');
        print('Response body: ${response.body}');

        throw Exception('Server error with status code ${response.statusCode}');
      }
    } catch (e) {
      print('Error posting data: $e');
      throw Exception('Error posting data: $e');
    }
  }
}
