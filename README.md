# PA Mobile – Frontend Application

## Overview

**PA Mobile** is a cross-platform frontend application built with **Flutter**, designed to act as a smart personal assistant for users seeking home and lifestyle services. The app allows users to browse, search, and book from a wide range of services including home cleaning, car cleaning, laundry, and dozens more — and uses an intelligent PA assistant to proactively suggest the right service based on what the user is looking for.

The backend is powered by a **Golang REST API**, providing fast and scalable data handling for service discovery, bookings, orders, and user management.

- **Date:** June 08, 2026
- **Framework:** Flutter
- **State Management:** BLoC (`flutter_bloc`)
- **Architecture:** Clean Architecture (Data, Domain, Presentation)
- **Navigation:** GoRouter
- **Dependency Injection:** GetIt
- **Platforms:** Android, iOS
- **Backend:** Golang REST API

---

## Project Structure

The project follows a **feature-first architecture** with **Clean Architecture** principles to ensure scalability, readability, and ease of maintenance.

```
pa_mobile/
├── README.md
├── pubspec.yaml
├── lib/
│   ├── app.dart                    # Main app widget
│   ├── main.dart                   # Entry point
│   │
│   ├── core/                       # Core functionality shared across features
│   │   ├── bloc/                   # Global BLoC observers
│   │   │   ├── app_bloc_observer.dart
│   │   │   └── bloc.dart
│   │   │
│   │   ├── config/                 # App configuration
│   │   │   ├── app_router.dart     # GoRouter configuration
│   │   │   ├── app_routes.dart     # Route constants
│   │   │   ├── env_config.dart     # Environment variables
│   │   │   └── config.dart
│   │   │
│   │   ├── di/                     # Dependency Injection (GetIt)
│   │   │   ├── core_injection.dart
│   │   │   ├── bloc_injection.dart
│   │   │   ├── datasource_injection.dart
│   │   │   ├── repository_injection.dart
│   │   │   ├── usecase_injection.dart
│   │   │   └── di.dart
│   │   │
│   │   ├── error/                  # Exception & failure handling
│   │   │   ├── exceptions.dart
│   │   │   └── failures.dart
│   │   │
│   │   ├── extensions/             # Dart extensions
│   │   │   ├── context_extension.dart
│   │   │   ├── string_extension.dart
│   │   │   ├── datetime_extension.dart
│   │   │   ├── media_query_extension.dart
│   │   │   └── extensions.dart
│   │   │
│   │   ├── network/                # Network layer
│   │   │   ├── api_client.dart     # Dio client & interceptors
│   │   │   ├── api_endpoints.dart  # Base URLs & endpoint constants
│   │   │   ├── network_info.dart
│   │   │   └── network.dart
│   │   │
│   │   ├── services/               # Core services
│   │   │   ├── analytics_service.dart
│   │   │   ├── notification_service.dart
│   │   │   ├── location_service.dart
│   │   │   └── services.dart
│   │   │
│   │   ├── storage/                # Local persistence
│   │   │   ├── hive_storage.dart
│   │   │   ├── secure_storage.dart
│   │   │   └── storage.dart
│   │   │
│   │   ├── shared_widgets/         # Reusable widgets
│   │   │   ├── pa_button.dart
│   │   │   ├── pa_text_field.dart
│   │   │   ├── pa_loader.dart
│   │   │   ├── pa_snackbar.dart
│   │   │   ├── pa_avatar.dart
│   │   │   └── shared_widgets.dart
│   │   │
│   │   ├── theme/                  # App theming
│   │   │   ├── app_colors.dart     # Color constants
│   │   │   ├── app_text_styles.dart
│   │   │   ├── app_dimensions.dart # Spacing, radius, sizes
│   │   │   ├── app_theme.dart      # ThemeData
│   │   │   └── theme.dart
│   │   │
│   │   └── utils/                  # Utility functions
│   │       ├── validators.dart
│   │       ├── formatters.dart
│   │       └── utils.dart
│   │
│   ├── features/                   # Feature modules (Clean Architecture)
│   │   ├── assistant/              # PA smart suggestion engine
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── assistant_remote_datasource.dart
│   │   │   │   │   └── datasources.dart
│   │   │   │   ├── models/
│   │   │   │   │   ├── suggestion_model.dart
│   │   │   │   │   └── models.dart
│   │   │   │   └── repositories/
│   │   │   │       ├── assistant_repo_impl.dart
│   │   │   │       └── repositories.dart
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   ├── suggestion.dart
│   │   │   │   │   └── entities.dart
│   │   │   │   ├── repositories/
│   │   │   │   │   ├── assistant_repo.dart
│   │   │   │   │   └── repositories.dart
│   │   │   │   └── usecases/
│   │   │   │       ├── get_suggestions_usecase.dart
│   │   │   │       ├── send_query_usecase.dart
│   │   │   │       └── usecases.dart
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── assistant_bloc.dart
│   │   │       │   ├── assistant_event.dart
│   │   │       │   ├── assistant_state.dart
│   │   │       │   └── bloc.dart
│   │   │       ├── views/
│   │   │       │   ├── assistant_view.dart
│   │   │       │   └── views.dart
│   │   │       └── widgets/
│   │   │           ├── suggestion_card.dart
│   │   │           ├── query_input_bar.dart
│   │   │           └── widgets.dart
│   │   │
│   │   ├── auth/                   # Authentication feature
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── auth_remote_datasource.dart
│   │   │   │   │   ├── auth_local_datasource.dart
│   │   │   │   │   └── datasources.dart
│   │   │   │   ├── models/
│   │   │   │   │   ├── user_model.dart
│   │   │   │   │   ├── token_model.dart
│   │   │   │   │   └── models.dart
│   │   │   │   └── repositories/
│   │   │   │       ├── auth_repo_impl.dart
│   │   │   │       └── repositories.dart
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   ├── user.dart
│   │   │   │   │   └── entities.dart
│   │   │   │   ├── repositories/
│   │   │   │   │   ├── auth_repo.dart
│   │   │   │   │   └── repositories.dart
│   │   │   │   └── usecases/
│   │   │   │       ├── login_usecase.dart
│   │   │   │       ├── register_usecase.dart
│   │   │   │       ├── logout_usecase.dart
│   │   │   │       ├── refresh_token_usecase.dart
│   │   │   │       └── usecases.dart
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── auth_bloc.dart
│   │   │       │   ├── auth_event.dart
│   │   │       │   ├── auth_state.dart
│   │   │       │   └── bloc.dart
│   │   │       ├── views/
│   │   │       │   ├── login_view.dart
│   │   │       │   ├── register_view.dart
│   │   │       │   ├── otp_view.dart
│   │   │       │   └── views.dart
│   │   │       └── widgets/
│   │   │
│   │   ├── home/                   # Home feature
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── home_remote_datasource.dart
│   │   │   │   │   └── datasources.dart
│   │   │   │   ├── models/
│   │   │   │   │   └── home_model.dart
│   │   │   │   └── repositories/
│   │   │   │       ├── home_repo_impl.dart
│   │   │   │       └── repositories.dart
│   │   │   ├── domain/
│   │   │   │   ├── repositories/
│   │   │   │   │   ├── home_repo.dart
│   │   │   │   │   └── repositories.dart
│   │   │   │   └── usecases/
│   │   │   │       └── usecases.dart
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── home_bloc.dart
│   │   │       │   ├── home_event.dart
│   │   │       │   ├── home_state.dart
│   │   │       │   └── bloc.dart
│   │   │       ├── views/
│   │   │       │   ├── home_view.dart
│   │   │       │   └── views.dart
│   │   │       └── widgets/
│   │   │           ├── services_grid.dart
│   │   │           ├── featured_banner.dart
│   │   │           ├── recent_orders_section.dart
│   │   │           └── widgets.dart
│   │   │
│   │   ├── services/               # Service catalogue & discovery
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── services_remote_datasource.dart
│   │   │   │   │   └── datasources.dart
│   │   │   │   ├── models/
│   │   │   │   │   ├── service_model.dart
│   │   │   │   │   └── models.dart
│   │   │   │   └── repositories/
│   │   │   │       ├── services_repo_impl.dart
│   │   │   │       └── repositories.dart
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   ├── service.dart
│   │   │   │   │   ├── service_category.dart
│   │   │   │   │   └── entities.dart
│   │   │   │   ├── repositories/
│   │   │   │   │   ├── services_repo.dart
│   │   │   │   │   └── repositories.dart
│   │   │   │   └── usecases/
│   │   │   │       ├── get_services_usecase.dart
│   │   │   │       ├── search_services_usecase.dart
│   │   │   │       ├── get_service_detail_usecase.dart
│   │   │   │       └── usecases.dart
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── services_bloc.dart
│   │   │       │   ├── services_event.dart
│   │   │       │   ├── services_state.dart
│   │   │       │   └── bloc.dart
│   │   │       ├── views/
│   │   │       │   ├── services_view.dart
│   │   │       │   ├── service_detail_view.dart
│   │   │       │   └── views.dart
│   │   │       └── widgets/
│   │   │
│   │   ├── booking/                # Booking & scheduling
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── booking_remote_datasource.dart
│   │   │   │   │   └── datasources.dart
│   │   │   │   ├── models/
│   │   │   │   │   ├── booking_model.dart
│   │   │   │   │   └── models.dart
│   │   │   │   └── repositories/
│   │   │   │       ├── booking_repo_impl.dart
│   │   │   │       └── repositories.dart
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   ├── booking.dart
│   │   │   │   │   ├── time_slot.dart
│   │   │   │   │   └── entities.dart
│   │   │   │   ├── repositories/
│   │   │   │   │   ├── booking_repo.dart
│   │   │   │   │   └── repositories.dart
│   │   │   │   └── usecases/
│   │   │   │       ├── create_booking_usecase.dart
│   │   │   │       ├── get_bookings_usecase.dart
│   │   │   │       ├── cancel_booking_usecase.dart
│   │   │   │       └── usecases.dart
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── booking_bloc.dart
│   │   │       │   ├── booking_event.dart
│   │   │       │   ├── booking_state.dart
│   │   │       │   └── bloc.dart
│   │   │       ├── views/
│   │   │       │   ├── booking_view.dart
│   │   │       │   ├── booking_confirmation_view.dart
│   │   │       │   └── views.dart
│   │   │       └── widgets/
│   │   │
│   │   ├── orders/                 # Order tracking & history
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── orders_remote_datasource.dart
│   │   │   │   │   └── datasources.dart
│   │   │   │   ├── models/
│   │   │   │   │   ├── order_model.dart
│   │   │   │   │   └── models.dart
│   │   │   │   └── repositories/
│   │   │   │       ├── orders_repo_impl.dart
│   │   │   │       └── repositories.dart
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   ├── order.dart
│   │   │   │   │   ├── order_status.dart
│   │   │   │   │   └── entities.dart
│   │   │   │   ├── repositories/
│   │   │   │   │   ├── orders_repo.dart
│   │   │   │   │   └── repositories.dart
│   │   │   │   └── usecases/
│   │   │   │       ├── get_orders_usecase.dart
│   │   │   │       ├── get_order_detail_usecase.dart
│   │   │   │       ├── track_order_usecase.dart
│   │   │   │       └── usecases.dart
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── orders_bloc.dart
│   │   │       │   ├── orders_event.dart
│   │   │       │   ├── orders_state.dart
│   │   │       │   └── bloc.dart
│   │   │       ├── views/
│   │   │       │   ├── orders_view.dart
│   │   │       │   ├── order_detail_view.dart
│   │   │       │   └── views.dart
│   │   │       └── widgets/
│   │   │
│   │   ├── profile/                # User profile feature
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── profile_remote_datasource.dart
│   │   │   │   │   └── datasources.dart
│   │   │   │   ├── models/
│   │   │   │   │   └── profile_model.dart
│   │   │   │   └── repositories/
│   │   │   │       ├── profile_repo_impl.dart
│   │   │   │       └── repositories.dart
│   │   │   ├── domain/
│   │   │   │   ├── repositories/
│   │   │   │   │   ├── profile_repo.dart
│   │   │   │   │   └── repositories.dart
│   │   │   │   └── usecases/
│   │   │   │       └── usecases.dart
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── profile_bloc.dart
│   │   │       │   ├── profile_event.dart
│   │   │       │   ├── profile_state.dart
│   │   │       │   └── bloc.dart
│   │   │       ├── views/
│   │   │       │   ├── profile_view.dart
│   │   │       │   ├── edit_profile_view.dart
│   │   │       │   └── views.dart
│   │   │       └── widgets/
│   │   │           ├── profile_header_comp.dart
│   │   │           └── widgets.dart
│   │   │
│   │   ├── notifications/          # Notification center
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   └── repositories/
│   │   │   ├── domain/
│   │   │   │   ├── repositories/
│   │   │   │   └── usecases/
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       ├── views/
│   │   │       │   ├── notifications_view.dart
│   │   │       │   └── views.dart
│   │   │       └── widgets/
│   │   │
│   │   ├── settings/               # Settings feature
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── settings_datasource.dart
│   │   │   │   │   └── datasources.dart
│   │   │   │   └── repositories/
│   │   │   │       ├── settings_repo_impl.dart
│   │   │   │       └── repositories.dart
│   │   │   ├── domain/
│   │   │   │   └── repositories/
│   │   │   │       ├── settings_repo.dart
│   │   │   │       └── repositories.dart
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── settings_bloc.dart
│   │   │       │   ├── settings_event.dart
│   │   │       │   ├── settings_state.dart
│   │   │       │   └── bloc.dart
│   │   │       ├── views/
│   │   │       │   ├── settings_view.dart
│   │   │       │   └── views.dart
│   │   │       └── widgets/
│   │   │           └── widgets.dart
│   │   │
│   │   ├── onboarding/             # First-run onboarding flow
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       ├── views/
│   │   │       │   ├── onboarding_view.dart
│   │   │       │   └── views.dart
│   │   │       └── widgets/
│   │   │
│   │   ├── splash/                 # Splash & app initialization
│   │   │   └── presentation/
│   │   │       └── views/
│   │   │           └── splash_view.dart
│   │   │
│   │   └── bottom_nav_bar/         # Bottom navigation bar
│   │       └── presentation/
│   │           ├── bloc/
│   │           ├── views/
│   │           │   ├── bottom_nav_bar.dart
│   │           │   └── views.dart
│   │           └── widgets/
│   │
│   └── l10n/                       # Localization
│       ├── app_en.arb
│       ├── app_ar.arb
│       └── app_localizations.dart
│
├── assets/
│   └── images/                     # Image assets
│
├── android/
└── ios/
```

---

## Architecture

### Clean Architecture Layers

Each feature follows **Clean Architecture** with three main layers:

1. **Presentation Layer** (`presentation/`)
    - **Views**: UI screens/widgets
    - **BLoC**: State management using events and states (`flutter_bloc`)
    - **Widgets**: Feature-specific reusable widgets

2. **Domain Layer** (`domain/`)
    - **Repositories**: Abstract repository interfaces
    - **Entities**: Core business logic objects
    - **Use Cases**: Single-responsibility business logic units

3. **Data Layer** (`data/`)
    - **Data Sources**: Remote (Golang API via Dio) and local (Hive) data sources
    - **Models**: Data transfer objects (DTOs) with JSON serialization
    - **Repository Implementations**: Concrete implementations of domain repositories

### Dependency Flow

```
Presentation → Domain ← Data
```

- **Presentation** depends on **Domain** (never on Data)
- **Data** implements **Domain** interfaces
- **Domain** is independent and contains all business logic

---

## Key Dependencies

### State Management & Architecture
- `flutter_bloc: ^9.1.1` - State management with BLoC
- `equatable: ^2.0.8` - Value equality for state and entity objects

### Navigation
- `go_router: ^14.0.0` - Declarative, type-safe routing

### Dependency Injection
- `get_it: ^8.0.0` - Service locator for DI

### Networking
- `dio: ^5.7.0` - HTTP client for Golang REST API
- `pretty_dio_logger: ^1.4.0` - Request/response logging
- `connectivity_plus: ^6.0.0` - Network status monitoring

### Local Storage
- `hive_flutter: ^1.1.0` - Fast NoSQL local storage
- `flutter_secure_storage: ^9.2.0` - Encrypted key-value storage

### UI & Styling
- `google_fonts: ^6.2.0` - Typography
- `gap: ^3.0.1` - Spacing widgets
- `cached_network_image: ^3.4.0` - Image caching
- `shimmer: ^3.0.0` - Loading skeleton UI

### Development Tools
- `flutter_lints: ^4.0.0` - Linting rules
- `mocktail: ^1.0.3` - Mocking for unit tests
- `bloc_test: ^9.1.7` - BLoC-specific testing utilities

### Internationalization
- `intl: ^0.19.0` - Localization & date formatting

---

## Best Practices

### Naming Conventions

- **`camelCase`** → variables & functions
- **`PascalCase`** → classes & widgets
- **`snake_case`** → file names

### Code Organization

- **Feature-Based Structure**: Organize code by feature, not by type
- **Single Responsibility**: One widget = one responsibility, one BLoC = one business logic flow
- **Part Files**: Use `part` and `part of` for related files (e.g., `views.dart` with `part 'login_view.dart'`)

### Comments & Documentation

- Use Dart doc comments (`///`) for public APIs
- Avoid unnecessary inline comments
- Document complex business logic

### Formatting

```sh
flutter format .
```

### State Management

- Use **BLoC** for all feature state management with typed events and states
- Name events as **past-tense actions** — what the user did, not what should happen
- Keep state classes immutable using `Equatable`
- Separate business logic from UI entirely — BLoC calls use cases, never data sources directly

### Widget Organization

- Extract reusable widgets to `shared_widgets/`
- Feature-specific widgets go in the feature's `widgets/` folder
- Use `part` files for related widgets in the same feature

### Error Handling

- Use try-catch blocks in data sources only
- Convert exceptions to typed `Failure` objects in repositories
- Handle failures in BLoC and emit user-friendly error states

---

## Getting Started

### Prerequisites

- Flutter SDK (stable channel)
- Dart SDK (included with Flutter)
- Android Studio / VS Code with Flutter extensions
- Access to the PA backend (Golang REST API)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd pa_mobile
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate code:
```bash
dart run build_runner build --delete-conflicting-outputs
```

4. Run the app:
```bash
flutter run
```

### Environment Configuration

Create a `.env` file at the project root:

```env
API_BASE_URL=https://api.pa-app.com/v1
API_TIMEOUT=30000
```

> ⚠️ Never commit `.env` to version control. It is listed in `.gitignore`.

### Build for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle (recommended for Play Store)
flutter build appbundle --release

# iOS (requires macOS + Xcode)
flutter build ios --release
```

---

## Project Features

### Current Features

- 🔲 **Onboarding** - First-run walkthrough
- 🔲 **Authentication** - Login, register, and OTP verification
- 🔲 **PA Assistant** - Smart service suggestion engine
- 🔲 **Home** - Main dashboard with featured services
- 🔲 **Service Discovery** - Browse, search, and filter services
- 🔲 **Booking** - Schedule and confirm service bookings
- 🔲 **Order Tracking** - Live status updates on active orders
- 🔲 **Profile** - User profile and preferences management
- 🔲 **Notifications** - Push notifications and alerts
- 🔲 **Settings** - Language, theme, and account settings
- 🔲 **Bottom Navigation** - Main navigation bar

### Shared Components

- `PAButton` - Reusable button with customizable styling
- `PATextField` - Input field with label, validation, and password toggle
- `PALoader` - Consistent loading indicator
- `PASnackbar` - Standardized success, error, and info messages
- `PAAvatar` - User avatar with fallback initials

---

## Color Scheme

The app uses a consistent color palette defined in `lib/core/theme/app_colors.dart`:

- **Primary**: TBD - Main brand color
- **Primary Light**: TBD - Backgrounds and chips
- **Surface**: TBD - Card backgrounds
- **Background**: TBD - Screen backgrounds
- **Dark Text**: TBD - Primary text color
- **Grey Text**: TBD - Secondary text color
- **White**: `#FFFFFF` - Background and text
- **Error**: TBD - Error states

> Update these values once the design system is finalized.

---

## Contributing

1. Follow the existing code structure and naming conventions
2. Write clean, maintainable code with BLoC for all state management
3. Add use cases for all business logic — never call repositories directly from the UI
4. Test your changes thoroughly — unit tests for use cases and BLoC, widget tests for UI
5. Format code using `flutter format .` and resolve all `flutter analyze` warnings before submitting

---

## License

This project is private and not published to pub.dev.

---

## Contact & Support

For questions or support, please contact the development team.