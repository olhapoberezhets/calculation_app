// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataModelImpl _$$DataModelImplFromJson(Map<String, dynamic> json) =>
    _$DataModelImpl(
      id: json['id'] as String,
      field: (json['field'] as List<dynamic>).map((e) => e as String).toList(),
      start: CoordinatesModel.fromJson(json['start'] as Map<String, dynamic>),
      end: CoordinatesModel.fromJson(json['end'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataModelImplToJson(_$DataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'field': instance.field,
      'start': instance.start,
      'end': instance.end,
    };
