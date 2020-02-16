import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:github_client/common/Global.dart';
import 'package:github_client/common/LocaleModel.dart';
import 'package:github_client/common/ThemeModel.dart';
import 'package:github_client/common/UserModel.dart';
import 'package:provider/provider.dart';

import 'i10n/localization_intl.dart';
import 'routes/HomeRoute.dart';
import 'routes/LanguageRoute.dart';
import 'routes/LoginRoute.dart';
import 'routes/ThemeChangeRoute.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (context, themeModel, localeModel, child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: themeModel.theme,
            ),
            onGenerateTitle: (context) {
              return GmLocalizations.of(context).title;
            },
            home: HomeRoute(),  // 应用主页
            locale: localeModel.getLocale(),
            // 我们只支持美国英语和中文简体
            supportedLocales: [
              const Locale("en", "US"), // 美国英语
              const Locale("zh", "hans_CN"),  // 中文简体
            ],
            localizationsDelegates: [
              // 本地化的代理类
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GmLocalizationsDelegate(),
            ],
            localeResolutionCallback: (_locale, supportedLocales) {
              if (localeModel.getLocale() != null) {
                // 如果已经选定语言，则不跟随系统
                return localeModel.getLocale();
              } else {
                Locale locale;
                // APP语言跟随系统语言，如果系统语言不是中文简体或美国英语，
                // 则默认使用美国英语
                if (supportedLocales.contains(locale)) {
                  locale = _locale;
                } else {
                  locale = Locale("en", "US");
                }
                return locale;
              }
            },
            routes: <String, WidgetBuilder>{
              "login": (context) => LoginRoute(),
              "themes": (context) => ThemeChangeRoute(),
              "language": (context) => LanguageRoute(),
            },
          );
        },
      ),
    );
  }
}