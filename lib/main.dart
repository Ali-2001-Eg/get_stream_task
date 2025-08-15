import 'package:flutter/material.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';
import 'config.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final token = _generateDevToken('demo-user-123');

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

String _generateDevToken(String userId) {
  const String apiKey = Config.apiKey;
  const String apiSecret = Config.secret;

  final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final payload = {
    'user_id': userId,
    'iss': 'stream',
    'iat': now,
    'exp': now + 24 * 60 * 60,
  };

  final jwt =
      JWT(payload).sign(SecretKey(apiSecret), algorithm: JWTAlgorithm.HS256);
  return jwt;
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

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _userIdController.text = 'user${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _userIdController.dispose();
    super.dispose();
  }

  Future<void> _joinCall() async {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    StreamVideo(
      Config.apiKey,
      failIfSingletonExists: false,
      user: User.guest(
        userId: _userIdController.text.trim(),
        name: _nameController.text.trim(),
      ),
    );

    if (!mounted) return;

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => VideoCallScreen(
          userName: _nameController.text.trim(),
          userId: _userIdController.text.trim(),
        ),
      ),
    );

    if (!mounted) return;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Video Call'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.video_call,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 30),
            const Text(
              'Welcome to GetStream Video Call',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter your information to join the test room',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(
                labelText: 'User ID',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.badge),
                helperText: 'This will be auto-generated',
              ),
              enabled: false,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _joinCall,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Join Call',
                        style: TextStyle(fontSize: 18),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Room: Test Room',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoCallScreen extends StatefulWidget {
  final String userName;
  final String userId;

  const VideoCallScreen({
    super.key,
    required this.userName,
    required this.userId,
  });

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late Call _call;
  bool _isConnecting = false;

  @override
  void initState() {
    super.initState();
    _initializeCall();
  }

  Future<void> _initializeCall() async {
    setState(() {
      _isConnecting = true;
    });

    try {
      _call = StreamVideo.instance.makeCall(
        callType: StreamCallType.defaultType(),
        id: Config.roomId,
      );

      await _call.getOrCreate();

      setState(() {
        _isConnecting = false;
      });
    } catch (e) {
      setState(() {
        _isConnecting = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating call: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Call'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.call_end),
            onPressed: () {
              _call.leave();
              Navigator.of(context).pop();
            },
            color: Colors.red,
          ),
        ],
      ),
      body: _isConnecting
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Connecting to call...'),
                ],
              ),
            )
          : StreamCallContainer(
              call: _call,
            ),
    );
  }
}
