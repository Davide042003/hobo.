import 'package:hobo_test/widgets/exports/base_export.dart';

class ChatModel {
  final String idChat;
  final String idSender;
  final List<String> idReceiverList;
  final String idCreator;
  final String description;
  final String idMessagelist;

  ChatModel({this.idChat, this.idSender, this.idReceiverList, this.idCreator, this.description, this.idMessagelist});

  factory ChatModel.fromJson(Map<dynamic, dynamic> json) {
    return ChatModel(
      idChat: json['idChat'],
      idSender: json['idSender'],
      idReceiverList: json['idReceiverList'],
      idCreator: json['idCreator'],
      description: json['description'],
      idMessagelist: json['idMessagelist'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idChat' : idChat,
      'idSender': idSender,
      'idReceiverList': idReceiverList,
      'idCreator': idCreator,
      'description': description,
      'idMessagelist': idMessagelist,
    };
  }
}
