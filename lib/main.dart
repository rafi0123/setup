import 'package:counter/app/bootstrap.dart';
import 'package:counter/core/enum/flavors.dart';

// Fallback entry point — defaults to dev
// Normally you always run via main_dev.dart or main_prod.dart
void main() => runAppWithFlavor(Flavor.dev);

/// running flutter app after success
// # Run dev flavor
// flutter run --flavor dev -t lib/main_dev.dart
//
// # Run prod flavor
// flutter run --flavor prod -t lib/main_prod.dart
