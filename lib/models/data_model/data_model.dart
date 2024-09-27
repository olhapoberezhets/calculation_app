import 'package:calculation_app/models/coordinates_mode/coordinates_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_model.freezed.dart';
part 'data_model.g.dart';

@freezed
class DataModel with _$DataModel {
  const factory DataModel({
    required String id,
    required List<String> field,
    required CoordinatesModel start,
    required CoordinatesModel end,
  }) = _DataModel;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}
