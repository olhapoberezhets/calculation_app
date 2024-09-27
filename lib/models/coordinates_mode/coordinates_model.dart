import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinates_model.freezed.dart';
part 'coordinates_model.g.dart';

@freezed
class CoordinatesModel with _$CoordinatesModel {
  const factory CoordinatesModel({
    required int x,
    required int y,
  }) = _CoordinatesModel;

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesModelFromJson(json);
}
