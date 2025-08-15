import '../exports.dart';

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
    return WillPopScope(
      onWillPop: () async {
        _call.leave();
        return true;
      },
      child: Scaffold(
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
          call: _call,onBackPressed: (){
          _call.leave();
          Navigator.of(context).pop();
        },
        ),
      ),
    );
  }
}
