part of 'config.dart';


/// App-wide configuration values based on the current flavor.
class FlavorConfig {
  // ─── API ─────────────────────────────────────────────────────
  static String get baseUrl {
    switch (F.appFlavor) {
      case Flavor.dev:
        return 'https://api.dev.yourapp.com';
      case Flavor.prod:
        return 'https://api.yourapp.com';
    }
  }

  // ─── Firebase ────────────────────────────────────────────────
  /// True in dev → points to local Firebase emulator
  static bool get useFirebaseEmulator => F.appFlavor == Flavor.dev;

  // ─── Helpers ─────────────────────────────────────────────────
  static bool get isDev  => F.appFlavor == Flavor.dev;
  static bool get isProd => F.appFlavor == Flavor.prod;
}