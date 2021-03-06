import 'package:flutter/material.dart';
import 'package:whatsapp/widget/chat/messages.dart';
import 'package:whatsapp/widget/chat/new_message.dart';

class ChatScreen extends StatelessWidget {
  static final chatScreenRoute = '/chatScreenRoute';
  
  final String anonymousUser;
  final String chatId;

  const ChatScreen({
    this.anonymousUser,
    this.chatId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 2.0,
          ),
          child: CircleAvatar(
            
            backgroundImage: AssetImage('assets/images/user.png', ),
          ),
        ),
        title: Text(anonymousUser),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.video_call),
            iconSize: 30,
            onPressed: () {
              // open device call function
            },
          ),
          IconButton(
            icon: Icon(Icons.call),
            iconSize: 30,
            onPressed: () {
              // open device call function
            },
          ),
          PopupMenuButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.green[700])),
            itemBuilder: (ctx) {
              return [
                PopupMenuItem(
                  child: Text('New Chats'),
                ),
                PopupMenuItem(
                  child: Text('Setting'),
                ),
              ];
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(child: Messages(chatId)),
            NewMessage(chatId),
          ],
        ),
      ),
    );
  }
}

// Firestore.instance
//     .collection('chats/1wMmz9gOk28y1F9a2PID/messages')
//     .snapshots()
//     .listen((data) {
//   // print(data.documents[0]['text]);
//   data.documents.forEach((element) {
//     print(element['text']);
//   });
// });
