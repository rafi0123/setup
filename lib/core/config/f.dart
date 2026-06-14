part of 'config.dart';
/// A utility class for managing the application's flavor configuration.
class F {
  /// The current flavor of the application, set during initialization.
  static late final Flavor appFlavor;

  /// Gets the name of the current flavor as a string.
  static String get name => appFlavor.name;

  /// Gets the application title based on the current flavor.
  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'MyApp Dev';
      case Flavor.prod:
        return 'MyApp';
    }
  }
}