import 'package:counter/core/app/app.dart';
import 'package:counter/core/config/config.dart';
import 'package:counter/core/enum/flavors.dart';
import 'package:flutter/material.dart';


Future<void> runAppWithFlavor(Flavor flavor) async {
  // 1. Set flavor first — everything depends on this
  F.appFlavor = flavor;

  // 2. Ensure Flutter is ready
  WidgetsFlutterBinding.ensureInitialized();

  // 3. Later: Firebase.initializeApp() goes here
  // 4. Later: if (AppConfig.useFirebaseEmulator) setup emulators here

  // 5. Run the app
  runApp(const MyApp());
}