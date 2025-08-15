





import 'exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.execute();
  final token = getIt<TokenUtils>().generateDevToken('demo-user-123');

  StreamVideo(
    Config.apiKey,
    user: User.regular(
      userId: 'demo-user-123',
      role: 'admin',
      name: 'Demo User',
    ),
    userToken: token,
  );
  runApp(const VideoCallApp());
}



class VideoCallApp extends StatelessWidget {
  const VideoCallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetStream Video Call',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const UserInfoScreen(),
    );
  }
}



