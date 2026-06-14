import 'package:counter/generated/strings.g.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // t gives you all translations for current locale
    final t = Translations.of(context);

    // Current locale
    final isArabic = LocaleSettings.currentLocale == AppLocale.ar;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.app.name),
        actions: [
          // ── Language toggle button ──────────────────
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                // Switch language
                LocaleSettings.setLocale(
                  isArabic ? AppLocale.en : AppLocale.ar,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  // Show opposite language as hint
                  isArabic ? 'EN' : 'AR',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t.app.name, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(t.app.tagline, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 32),
            Text(t.common.loading),
            Text(t.common.error),
            Text(t.auth.login),
            Text(t.auth.forgotPassword),
          ],
        ),
      ),
    );
  }
}
