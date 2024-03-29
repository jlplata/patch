import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';



final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class ChatScreen extends StatefulWidget {
  CurvedNavigationBarState get currentState => null;
  static final String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String messageText;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

//  void getMessages()async {
//    final messages = await _firestore.collection('messages').getDocuments();
//    for(var message in messages.documents){
//
//    }
//  }

  // --- this method is used to listen to the stream of messgaes from the firebase database.

  void messagesStream() async {
    // this is a bunch of futures (list of future objects ! :-)), by using this I have subscribed to the data stream in the database.
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      // this is a list of Documnet snapshots !!, this loop helps in iterarting over that list and get the document data
      for (var message in snapshot.documents) {}
    }
  }

  // everytime data is added or modified the messagesStream() method gets active !!

  void deleteMessages() async {
    final messages = await _firestore.collection('messages').getDocuments();
    for (var message in messages.documents) {
      _firestore.collection('messages').document(message.documentID).delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFF1E2122),
      appBar: AppBar(
      
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete,
              color: Colors.white),
              onPressed: () {
                deleteMessages();
              }),
        ],
        title: Text(
          'Mensajes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1E2122),
      ),
      body: Container(
         decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
        child: SafeArea(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MessageStream(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        
                        controller: messageTextController,
                        onChanged: (value) {
                          
                          messageText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        messageTextController.clear();
                        _firestore.collection('messages').add(
                          {
                            'text': messageText,
                            'sender': loggedInUser.email,
                            'timestamp': FieldValue.serverTimestamp()
                          },
                        );
                      },
                      child: Text(
                        'Enviar',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          _firestore.collection('messages').orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageBubbles = [];
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents.reversed;

        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];

          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );

          messageBubbles.add(messageBubble);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 5),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                : BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
            elevation: 5,
            color: isMe ? Color(0xffc7f0db) : Color(0xff8bbabb),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                '$text',
                style: TextStyle(
                  color: isMe ? Colors.black : Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
