import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<MessageModel> getMessagesList(QuerySnapshot<Object?> messagesInFireStore) {
  final List<MessageModel> messagesList = [];
  for (int i = 0; i < messagesInFireStore.docs.length; i++) {
    messagesList.add(
      MessageModel(message: messagesInFireStore.docs[i][kMessageCollection]),
    );
  }
  return messagesList;
}
