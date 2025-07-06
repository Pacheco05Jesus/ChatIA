  
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:flutter_application_1/Bloc/home_state.dart';
  import 'home_event.dart';
  import '../Servidor/servicio_IA.dart';

  class ChatBloc extends Bloc<ChatEvent, ChatState> {
    final OpenAIService openAIService;

    ChatBloc({required this.openAIService}) : super(const ChatInitial()) {
      on<SendMessageEvent>(_onSendMessage);
    }

    Future<void> _onSendMessage(
      SendMessageEvent event,
      Emitter<ChatState> emit,
    ) async {
      emit(const ChatLoading());
      try {
        final response = await openAIService.sendMessage(event.prompt);
        emit(ChatSucces(response));
      } catch (e) {
        emit(ChatError(e.toString()));
      }
    }
  }