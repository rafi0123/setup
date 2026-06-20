import 'package:counter/core/config/config.dart';
import 'package:counter/generated/strings.g.dart';
import 'package:counter/pages/my_home_page.dart';
import 'package:flutter/material.dart';

// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Reads current locale from TranslationProvider
    final locale = TranslationProvider.of(context).flutterLocale;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: F.title,
      locale: locale,
      supportedLocales: AppLocale.values.map((e) => e.flutterLocale),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      home: MyHomePage(),
    );
  }
}
