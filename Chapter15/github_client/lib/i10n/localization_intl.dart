import 'package:flutter/cupertino.dart';
import 'package:github_client/i10n/messages_all.dart';
import 'package:intl/intl.dart';

class GmLocalizations {

  static Future<GmLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    String localeName = Intl.canonicalizedLocale(name);
    print("Locale: $localeName");
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new GmLocalizations();
    });
  }

  static GmLocalizations of(BuildContext context) {
    return Localizations.of<GmLocalizations>(context, GmLocalizations);
  }

  String get title {
    return Intl.message(
      "GitHub",
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }

  String get home => Intl.message('Github', name: 'home');

  String get language => Intl.message('Language', name: 'language');

  String get login => Intl.message("Login", name: "login");

  String get auto => Intl.message("Auto", name: "auto");

  String get setting => Intl.message("Setting", name: "setting");

  String get theme => Intl.message("Theme", name: "theme");

  String get noDescription => Intl.message("No description yet!", name: "noDescription");

  String get userName => Intl.message("User Name", name: "userName");
  String get userNameRequired => Intl.message("User name required", name: "userNameRequired");
  String get password => Intl.message("Password", name: "password");
  String get passwordRequired => Intl.message("Passwordd required!", name: "passwordRequired");
  String get userNameOrPasswordWrong => Intl.message("User name or password is not correct!", name: "userNameOrPasswordWrong");
  String get logout => Intl.message("logout", name: "logout");
  String get logoutTip => Intl.message("Are you sure you want to quit your current account?", name: "logoutTip");
  String get yes => Intl.message("yes", name: "yes");
  String get cancel => Intl.message("cancel", name: "cancel");

}

class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {

  const GmLocalizationsDelegate();

  // 是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<GmLocalizations> load(Locale locale) {
    return GmLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<GmLocalizations> old) => false;

}