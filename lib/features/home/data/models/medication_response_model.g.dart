// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationResponseModel _$MedicationResponseModelFromJson(
        Map<String, dynamic> json) =>
    MedicationResponseModel(
      name: json['name'] as String,
      type: json['type'] as String,
      dateTime: const TimestampConverter().fromJson(json['dateTime']),
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      dose: json['dose'] as String,
      amount: (json['amount'] as num).toInt(),
      isTaken: (json['isTaken'] as num).toInt(),
    );

Map<String, dynamic> _$MedicationResponseModelToJson(
        MedicationResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'dateTime': const TimestampConverter().toJson(instance.dateTime),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'dose': instance.dose,
      'amount': instance.amount,
      'isTaken': instance.isTaken,
    };
