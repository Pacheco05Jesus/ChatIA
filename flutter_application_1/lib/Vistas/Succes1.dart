import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/Modelo/Data.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatIA',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Succes1(response: 'Hola soy ChatIA'),
    );
  }
}

class Succes1 extends StatefulWidget {
  final String response;

  const Succes1({required this.response, super.key});

  @override
  _Succes1State createState() => _Succes1State();
}

class _Succes1State extends State<Succes1> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _messages.insert(
      0,
      ChatMessage(
        text: widget.response,
        timestamp: DateTime.now(),
        isMe: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); 
    super.dispose();
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.insert(
        0,
        ChatMessage(text: text, timestamp: DateTime.now(), isMe: true),
      );
    });

    _controller.clear();
  }

  Widget _buildMessage(ChatMessage message) {
    final time = DateFormat.Hm().format(message.timestamp);

    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: message.isMe
              ? const Color.fromARGB(255, 3, 238, 46)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: message.isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(
                fontSize: 16,
                color: message.isMe ? Colors.black : Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(fontSize: 10, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                onSubmitted: _sendMessage,
                decoration: InputDecoration(
                  hintText: 'Escribe un mensaje...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(
                Icons.send,
                color: const Color.fromARGB(255, 5, 150, 0),
              ),
              onPressed: () => _sendMessage(_controller.text),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ChatIA')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) => _buildMessage(_messages[index]),
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }
}