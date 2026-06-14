import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  runApp(const App());
}

/// running flutter app after success
// # Run dev flavor
// flutter run --flavor dev -t lib/main_dev.dart
//
// # Run prod flavor
// flutter run --flavor prod -t lib/main_prod.dart