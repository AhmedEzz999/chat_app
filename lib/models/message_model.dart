import 'package:chat_app/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;

  MessageModel({required this.message});
  factory MessageModel.fromJson(QueryDocumentSnapshot message) {
    return MessageModel(message: message[kMessageCollection]);
  }
}
