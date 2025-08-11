import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechScreen extends StatefulWidget {
  const TextToSpeechScreen({super.key});

  @override
  State<TextToSpeechScreen> createState() => _TextToSpeechScreenState();
}

class _TextToSpeechScreenState extends State<TextToSpeechScreen> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textController = TextEditingController();

  Future<void> _speak() async {
    if (textController.text.isNotEmpty) {
      await flutterTts.speak(textController.text);
      await flutterTts.setLanguage("hi-IN");
      await flutterTts.setLanguage("en-US");
      await flutterTts.setSpeechRate(1);
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text To Speech Fun App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              maxLines: 6,
              controller: textController,
              decoration: InputDecoration(
                fillColor: Colors.blue.withOpacity(0.2),
                filled: true,
                labelText: 'Enter text here', labelStyle: TextStyle(color: Colors.black87),
                border: OutlineInputBorder(
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _speak,
              icon: Icon(Icons.volume_up, color: Colors.white),
              label: Text('Speak', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
