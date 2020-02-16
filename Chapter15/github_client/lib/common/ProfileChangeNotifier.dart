import 'package:flutter/material.dart';
import 'package:github_client/common/Global.dart';
import 'package:github_client/models/index.dart';

class ProfileChangeNotifier extends ChangeNotifier {

  Profile get profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile();
    super.notifyListeners();
  }

}