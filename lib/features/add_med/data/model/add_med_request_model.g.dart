// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_med_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMedRequestModel _$AddMedRequestModelFromJson(Map<String, dynamic> json) =>
    AddMedRequestModel(
      name: json['name'] as String,
      repeatType: json['repeatType'] as String,
      intervalHours: (json['intervalHours'] as num?)?.toInt(),
      durationDays: (json['durationDays'] as num?)?.toInt(),
      type: json['type'] as String,
      dateTime: const TimestampConverter().fromJson(json['dateTime']),
      dose: json['dose'] as String,
      amount: (json['amount'] as num).toInt(),
      isTaken: (json['isTaken'] as num).toInt(),
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$AddMedRequestModelToJson(AddMedRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'dateTime': const TimestampConverter().toJson(instance.dateTime),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'dose': instance.dose,
      'amount': instance.amount,
      'isTaken': instance.isTaken,
      'repeatType': instance.repeatType,
      'intervalHours': instance.intervalHours,
      'durationDays': instance.durationDays,
    };
