import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'user.g.dart';

/// 这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()

class User {

  User({this.name, this.email});

  String name;
  String email;

  // 不同的类使用不通的mixin即可
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}


//class User {
//  final String name;
//  final String email;
//
//  User({this.name, this.email});
//
//  User.fromeJson(Map<String, dynamic> json) : name = json['name'], email = json['email'];
//
//  Map<String, dynamic> toJson() => <String, dynamic> {'name': name, 'email': email};
//}