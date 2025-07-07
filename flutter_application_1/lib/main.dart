import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Servidor/servicio_IA.dart';
import 'Bloc/home_bloc.dart';
import 'Bloc/home_event.dart';
import 'Bloc/home_state.dart';

import 'Vistas/Inicial.dart';
import 'Vistas/Falla.dart';
import 'Vistas/Carga.dart';
import 'Vistas/Succes1.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ChatBloc(openAIService: OpenAIService()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatIA',
      debugShowCheckedModeBanner: false,
      home: Inicial(),
    );
  }
}


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  
  @override
  void dispose() {
    _controller.dispose(); 
    super.dispose();
  }

  void _sendMessage() {
    final prompt = _controller.text.trim();
    if (prompt.isEmpty) return;

    context.read<ChatBloc>().add(SendMessageEvent(prompt));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text("ChatIA")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Escribe tu mensaje...",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  if (state is ChatLoading) {
                    return const Carga();
                  } else if (state is ChatSucces) {
                    return Succes1(response: state.response);
                  } else if (state is ChatError) {
                    return Falla(mensaje: state.error,
                    onReintentar: ()
                    {context.read<ChatBloc>().add(const ReintentarChatEvent()
                    );
                    }
                    );
                  } else {
                    return Inicial ();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}