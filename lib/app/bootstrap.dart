import 'package:counter/app/app.dart';
import 'package:counter/core/config/config.dart';
import 'package:counter/core/enum/flavors.dart';
import 'package:counter/generated/strings.g.dart';
import 'package:flutter/material.dart';

Future<void> runAppWithFlavor(Flavor flavor) async {
  // 1. Set flavor first — everything depends on this
  F.appFlavor = flavor;

  // 2. Ensure Flutter is ready
  WidgetsFlutterBinding.ensureInitialized();

  // Set default language to English
  LocaleSettings.setLocale(AppLocale.en);

  // 3. Later: Firebase.initializeApp() goes here
  // 4. Later: if (AppConfig.useFirebaseEmulator) setup emulators here

  // 5. Run the app
  runApp(TranslationProvider(child: const MyApp()));
}
