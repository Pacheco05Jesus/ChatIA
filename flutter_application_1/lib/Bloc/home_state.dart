import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {
  const ChatInitial ();

   @override
  List<Object> get props => [];
}

class ChatLoading extends ChatState {
  const ChatLoading ();

   @override
  List<Object> get props => [];
}

class ChatSucces extends ChatState {
  final String response;
  const ChatSucces (this.response);

   @override
  List<Object> get props => [response];
}

class ChatError extends ChatState {
  final String error;
  const ChatError (this.error);

   @override
  List<Object> get props => [Error];
}