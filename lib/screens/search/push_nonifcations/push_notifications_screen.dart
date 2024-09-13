import 'package:admin_app/screens/search/push_nonifcations/ppush_nonifications_method.dart';
import 'package:flutter/material.dart';

class PushNotificationScreen extends StatefulWidget {
  @override
  _PushNotificationScreenState createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  // Function to handle sending notification
  void _sendNotification() async {
    final String title = _titleController.text;
    final String content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      // Call your sendOneSignalNotification method here
      await sendOneSignalNotification(title, content); // Pass title and content
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Notification sent successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in both fields.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Push Notification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/icon.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.title),
                      fillColor: Colors.white38,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        // borderSide: BorderSide(
                        //   color: Colors.black,
                        //   width: 2,
                        // ),
                      ),
                      labelText: 'Notification Title',
                      labelStyle: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    maxLength: 100,
                    maxLines: 5,
                    controller: _contentController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.content_paste),
                      fillColor: Colors.white38,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'Notification Content',
                      labelStyle: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white12,
                        shape: StadiumBorder(),
                      ),
                      onPressed: _sendNotification,
                      child: Text(
                        'Send Notification',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
