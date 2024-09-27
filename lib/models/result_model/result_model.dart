import 'package:calculation_app/models/coordinates_mode/coordinates_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_model.freezed.dart';
part 'result_model.g.dart';

@freezed
class ResultModel with _$ResultModel {
  const factory ResultModel({
    required String id,
    required ResultData result,
  }) = _ResultModel;

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);
}

@freezed
class ResultData with _$ResultData {
  const factory ResultData({
    required List<CoordinatesModel> steps,
    required String path,
  }) = _ResultData;

  factory ResultData.fromJson(Map<String, dynamic> json) =>
      _$ResultDataFromJson(json);
}
