# GetStream Video Call App

A Flutter video calling application using GetStream's Stream Video SDK with advanced features.

## Features Implemented

1. **GoRouter Navigation** - Modern navigation using go_router package
2. **BLoC State Management** - Proper state management for call states
3. **Picture-in-Picture (PIP)** - Support for PIP mode on compatible devices
4. **Screen Sharing** - Ability to share your screen during calls
5. **Enhanced UI/UX** - Beautiful and user-friendly interface
6. **Call State Management** - Prevents multiple join attempts
7. **No App Bar** - Clean interface without app bars as requested

## Getting Started

### Prerequisites

- Flutter SDK
- GetStream Account with API Key and Secret

### Installation

1. Clone the repository
2. Run `fvm flutter pub get` to install dependencies
3. Update `lib/config.dart` with your GetStream credentials
4. Run the app with `fvm flutter run`

### Configuration

Update the `lib/config.dart` file with your GetStream credentials:

```dart
class Config {
  static const String apiKey = 'your_api_key_here';
  static const String roomId = 'test-room';
  static const String secret = 'your_secret_here';
}
```

## Features

### Picture-in-Picture (PIP)

The app supports PIP mode on compatible devices (Android Oreo and above). 
To enable PIP:
1. Join a call
2. Tap the "PIP Mode" button in the bottom action bar

### Screen Sharing

Share your screen during a call:
1. Join a call
2. Tap the screen share icon in the bottom action bar

### Enhanced Bottom Actions

The bottom action bar has been redesigned to be more user-friendly with:
- Camera toggle
- Microphone toggle
- End call button
- Speaker toggle
- Screen share toggle
- PIP mode button

### Call State Management

The app prevents multiple join attempts by:
1. Checking the BLoC state before joining
2. Showing appropriate messages when already in a call

## Architecture

The app uses:
- **BLoC Pattern** for state management
- **go_router** for navigation
- **Stream Video SDK** for video calling features

## Dependencies

- stream_video_flutter: ^0.10.2
- stream_video: ^0.10.2
- go_router: ^14.0.0
- flutter_bloc: ^8.1.6
- dart_jsonwebtoken: ^3.2.0

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a pull request

## License

This project is licensed under the MIT License.
