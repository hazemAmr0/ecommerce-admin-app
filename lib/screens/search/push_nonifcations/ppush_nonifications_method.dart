import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> sendOneSignalNotification(String title, String content) async {
  const String url = "https://onesignal.com/api/v1/notifications";
  const String apiKey = 'Y2NlY2ZkZDQtMDQ5ZS00N2E1LWI5NzUtYTg1MTZlZWIwZDIx';
  const String appId = '7f6cc79a-99b1-4398-b4d5-fe76186562f8';
  final Map<String, dynamic> requestBody = {
    'included_segments': ['All'],
    'headings': {'en': title},
    'contents': {'en': content},
    'ios_interruption_level': 'critical',
    'app_id': appId,
    'large_icon': 'ic_stat_onesignal_default',
    'data': {'foo': 'additional data'},
    'big_picture': 'assets/icon.png',
    
    'small_icon': 'ic_stat_onesignal_default',  
  };
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Basic $apiKey',
    'Accept': 'application/json',
  };

  try {
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(requestBody),
    );
    if (response.statusCode == 200) {
      print('Notification sent');
    } else {
      print('Notification failed');
    }
  } catch (e) {
    print('Notification failed: $e');
  }
}
