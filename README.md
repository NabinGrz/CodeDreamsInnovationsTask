# Flutter App

This is a Flutter app built using Clean Architecture and Flutter for state management. It utilizes various packages for features such as Google Maps integration, Firebase authentication, HTTP requests, and more.

## Dependencies

- [cupertino_icons](https://pub.dev/packages/cupertino_icons): ^1.0.6
- [google_maps_flutter](https://pub.dev/packages/google_maps_flutter): ^2.2.5
- [firebase_auth](https://pub.dev/packages/firebase_auth): ^4.16.0
- [firebase_core](https://pub.dev/packages/firebase_core): ^2.24.2
- [dartz](https://pub.dev/packages/dartz): ^0.10.1
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil): ^5.9.0
- [pin_code_fields](https://pub.dev/packages/pin_code_fields): ^8.0.1
- [get_it](https://pub.dev/packages/get_it): ^7.6.7
- [hooks_riverpod](https://pub.dev/packages/hooks_riverpod): ^2.4.10
- [geolocator](https://pub.dev/packages/geolocator): ^11.0.0
- [freezed](https://pub.dev/packages/freezed): ^2.4.7
- [http](https://pub.dev/packages/http): ^0.13.5
- [flutter_polyline_points](https://pub.dev/packages/flutter_polyline_points): ^1.0.0
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv): ^5.1.0
- [flutter_lints](https://pub.dev/packages/flutter_lints): ^3.0.0
- [build_runner](https://pub.dev/packages/build_runner): ^2.4.8
- [json_serializable](https://pub.dev/packages/json_serializable): ^6.7.1

## Flutter & Dart SDK Version

- Flutter SDK: 3.19.0
- Dart SDK: 3.3.0

## Architecture

This app follows the Clean Architecture pattern to maintain separation of concerns and make the codebase more scalable and maintainable.

## State Management

State management in this app is handled using Riverpod. 

## Description

This app allows users to search for places using keywords. The app then displays the searched places on Google Maps. Additionally, it provides users with information about the distance and travel time from their current location to the searched places, leveraging the Google Distance Matrix API. It also utilizes Geocoding and Places API for location-based services such as converting addresses into geographic coordinates (latitude and longitude) and fetching details about places.

