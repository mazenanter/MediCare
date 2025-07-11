import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String email;
  final String password;
  final String name;

  RegisterRequestBody({
    required this.email,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
