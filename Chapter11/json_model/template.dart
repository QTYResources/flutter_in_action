import 'dart:js';

import 'package:json_annotation/json_annotation.dart';

%t

part '%s.g.dart';

@JavaSerializable()

class %s {

  %s();

  %s

  factory %s.fromJson(Map<String, dynamic> json) => _$%sFromJson(json);

  Map<String, dynamic> toJson() => _$%sToJson(this);

}