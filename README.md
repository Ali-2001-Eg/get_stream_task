# 🎥 GetStream Video Call App

A modern, feature-rich Flutter video calling application built with GetStream's Stream Video SDK, featuring real-time video communication, beautiful UI, and professional architecture patterns.

## 📱 Demo

[![GetStream Video Call App Demo](https://img.shields.io/badge/YouTube-Demo%20Video-red?style=for-the-badge&logo=youtube)](https://youtu.be/5Ll4ts33DLI)

> **Watch the full demo on YouTube** - See the app in action with all its video calling features and UI!

## ✨ Features

- **🎥 Real-Time Video Calls**: High-quality video communication using GetStream's Stream Video SDK
- **👤 User Management**: Dynamic user ID generation and name-based identification
- **🎨 Modern UI Design**: Material Design 3 with blue theme and clean interface
- **📱 Responsive Layout**: Adapts perfectly to all screen sizes and orientations
- **🔄 Call State Management**: Prevents multiple join attempts and manages call lifecycle
- **🎯 Clean Navigation**: Seamless flow from user input to video call screen
- **🔒 Secure Authentication**: JWT token-based authentication for secure video calls
- **📱 Cross-Platform**: Works on both Android and iOS devices

## 🛠️ Technical Implementation

### **Packages & Dependencies**

This app is built using the following key packages from `pubspec.yaml`:

- **`stream_video_flutter`** - Flutter widgets for Stream Video SDK integration
- **`stream_video`** - Core Stream Video SDK for video calling functionality
- **`dart_jsonwebtoken`** - JWT token generation for secure authentication
- **`get_it`** - Dependency injection and service locator pattern
- **`flutter`** - Latest Flutter SDK with Material Design 3 support

### **Core Architecture**

#### **Service Locator Pattern**
- **Location**: `lib/utils/service_locator.dart`
- **Purpose**: Centralized dependency injection and service management
- **Implementation**: Uses `get_it` package for clean architecture and testability

#### **Token Management**
- **Location**: `lib/utils/token_utils.dart`
- **Purpose**: Generates JWT tokens for GetStream authentication
- **Security**: Implements secure token generation for video call access

#### **Configuration Management**
- **Location**: `lib/config.dart`
- **Purpose**: Centralized app configuration including API keys and room settings
- **Flexibility**: Easy to update GetStream credentials and room configurations

### **Video Call Implementation**

#### **Call Initialization**
- **Location**: `lib/screens/video_call_screen.dart`
- **Process**: Creates and manages Stream Video call instances
- **Error Handling**: Comprehensive error handling with user feedback

#### **User Interface Flow**
- **Welcome Screen**: User input for name and auto-generated user ID
- **Call Screen**: Full-featured video calling interface with Stream Video widgets
- **Navigation**: Seamless transitions between screens with proper state management

#### **Call State Management**
- **Connection States**: Loading, connected, and error states
- **Lifecycle Management**: Proper call cleanup and resource management
- **User Experience**: Prevents multiple join attempts and provides clear feedback

### **UI Components**

#### **Custom Widgets**
- **`UserInfoScreen`** - Welcome screen with user input and validation
- **`VideoCallScreen`** - Main video calling interface with Stream Video integration
- **`StreamCallContainer`** - GetStream's video call widget with custom back handling

#### **Theme System**
- **Material Design 3**: Modern design language with blue color scheme
- **Responsive Design**: Adaptive layouts for different screen sizes
- **User Experience**: Clean, intuitive interface without unnecessary clutter

## 🚀 Getting Started

### **Prerequisites**
- Flutter SDK (3.8.1 or higher)
- Dart SDK (3.8.1 or higher)
- GetStream Account with API Key and Secret
- Android Studio / VS Code

### **Installation**
```bash
# Clone the repository
git clone https://github.com/yourusername/get_stream.git

# Navigate to project directory
cd get_stream

# Install dependencies
flutter pub get

# Configure GetStream credentials
# Update lib/config.dart with your API key and secret

# Run the app
flutter run
```

### **Configuration**
Update the `lib/config.dart` file with your GetStream credentials:

```dart
class Config {
  static const String apiKey = 'your_api_key_here';
  static const String roomId = 'test-room';
  static const String secret = 'your_secret_here';
}
```

### **Build for Production**
```bash
# Android APK
flutter build apk --release

# iOS (requires macOS)
flutter build ios --release
```

## 📁 Project Structure

```
lib/
├── config.dart              # App configuration and constants
├── exports.dart             # Centralized exports for clean imports
├── main.dart                # App entry point and initialization
├── screens/
│   ├── user_info_screen.dart    # Welcome screen with user input
│   └── video_call_screen.dart   # Main video calling interface
├── utils/
│   ├── service_locator.dart     # Dependency injection setup
│   └── token_utils.dart         # JWT token generation
└── video_call_app.dart      # Main app widget
```

## 🔧 Key Features Implementation

### **Video Call Integration**
- **Stream Video SDK**: Seamless integration with GetStream's video platform
- **Call Management**: Automatic call creation, joining, and cleanup
- **Real-time Communication**: High-quality video and audio streaming

### **User Experience**
- **Dynamic User IDs**: Auto-generated unique identifiers for each session
- **Input Validation**: Ensures proper user information before joining calls
- **Loading States**: Clear feedback during connection and call setup

### **State Management**
- **Call Lifecycle**: Proper initialization, connection, and cleanup
- **Error Handling**: User-friendly error messages and recovery options
- **Navigation Flow**: Smooth transitions between app screens

### **Security Features**
- **JWT Authentication**: Secure token-based authentication with GetStream
- **User Validation**: Input sanitization and validation
- **Secure Communication**: Encrypted video call streams

## 🎯 Future Enhancements

- [ ] Group video calls with multiple participants
- [ ] Screen sharing functionality
- [ ] Chat integration during calls
- [ ] Call recording capabilities
- [ ] Push notifications for incoming calls
- [ ] Offline mode and call history
- [ ] Custom video filters and effects
- [ ] Multi-language support
- [ ] Accessibility improvements

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Ali Mazen**
- GitHub: [@Ali-2001-Eg](https://github.com/Ali-2001-Eg/)
- LinkedIn: [Ali Mazen](https://www.linkedin.com/in/ali-mazen-83797b19a/)

## 🙏 Acknowledgments

- GetStream team for the excellent Stream Video SDK
- Flutter team for the amazing cross-platform framework
- Material Design team for the beautiful design system
- Open source community for inspiration and support

## 🔗 Useful Links

- [GetStream Documentation](https://getstream.io/docs/)
- [Stream Video Flutter Package](https://pub.dev/packages/stream_video_flutter)
- [Flutter Official Documentation](https://flutter.dev/docs)
- [Material Design Guidelines](https://material.io/design)

---

⭐ **Star this repository if you found it helpful!**

🔗 **Watch the demo video**: [YouTube Demo](https://youtu.be/5Ll4ts33DLI)

💬 **Questions?** Open an issue or reach out on LinkedIn!
