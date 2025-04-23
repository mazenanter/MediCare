import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/helpers/time_stamp_converter.dart';

part 'medication_response_model.g.dart';

@JsonSerializable()
class MedicationResponseModel {
  final String name;
  final String type;
  @TimestampConverter()
  final Timestamp dateTime;
  @TimestampConverter()
  final Timestamp createdAt;
  final String dose;
  final String repeatType;
  final int? intervalHours;
  final int? durationDays;
  final int amount;
  final int isTaken;

  MedicationResponseModel(
      {required this.name,
      required this.repeatType,
      this.intervalHours,
      this.durationDays,
      required this.type,
      required this.dateTime,
      required this.createdAt,
      required this.dose,
      required this.amount,
      required this.isTaken});

  factory MedicationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MedicationResponseModelFromJson(json);
}
