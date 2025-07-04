import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/helpers/time_stamp_converter.dart';

part 'add_med_request_model.g.dart';

@JsonSerializable()
class AddMedRequestModel {
  final String id;
  final String name;
  final String type;
  @TimestampConverter()
  final Timestamp dateTime;
  @TimestampConverter()
  final Timestamp? createdAt;
  final String dose;
  final int amount;
  final int isTaken;
  final String repeatType;
  final int? intervalHours;
  final int? durationDays;
  AddMedRequestModel(
      {required this.name,
      required this.id,
      required this.repeatType,
      this.intervalHours,
      this.durationDays,
      required this.type,
      required this.dateTime,
      required this.dose,
      required this.amount,
      required this.isTaken,
      this.createdAt});
  factory AddMedRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddMedRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddMedRequestModelToJson(this);
}
