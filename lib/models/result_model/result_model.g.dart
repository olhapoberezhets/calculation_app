// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultModelImpl _$$ResultModelImplFromJson(Map<String, dynamic> json) =>
    _$ResultModelImpl(
      id: json['id'] as String,
      result: ResultData.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResultModelImplToJson(_$ResultModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'result': instance.result,
    };

_$ResultDataImpl _$$ResultDataImplFromJson(Map<String, dynamic> json) =>
    _$ResultDataImpl(
      steps: (json['steps'] as List<dynamic>)
          .map((e) => CoordinatesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
    );

Map<String, dynamic> _$$ResultDataImplToJson(_$ResultDataImpl instance) =>
    <String, dynamic>{
      'steps': instance.steps,
      'path': instance.path,
    };
