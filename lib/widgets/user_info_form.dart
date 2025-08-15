import 'package:flutter/material.dart';

class UserInfoForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController userIdController;
  final bool isLoading;
  final VoidCallback onJoinCall;

  const UserInfoForm({
    super.key,
    required this.nameController,
    required this.userIdController,
    required this.isLoading,
    required this.onJoinCall,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Your Name',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: userIdController,
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
            onPressed: isLoading ? null : onJoinCall,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: isLoading
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
    );
  }
}
