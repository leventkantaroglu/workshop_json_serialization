import 'package:json_annotation/json_annotation.dart';

import 'company.dart';

part "member_model.g.dart";

@JsonSerializable()
class Member {
  String name;
  String email;
  String website;
  Company company;
  Member({
    required this.name,
    required this.email,
    required this.website,
    required this.company,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
