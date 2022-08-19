import 'package:auto_direction/auto_direction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eschool_web_app/controller/global_vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({Key key}) : super(key: key);

  @override
  State<AnnouncementsPage> createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  final _messageController = TextEditingController();
  String message = '';

  String getCurrentDate() {
    final DateTime currDate = DateTime.now();
    final DateFormat formatter = DateFormat('EEEE, dd MMMM');
    final String formattedDate = formatter.format(currDate);
    return formattedDate;
  }

  void addMessageToDatabase(String value) async {
    await FirebaseFirestore.instance.collection('announcements').add({
      'date': getCurrentDate(),
      'timestamp': Timestamp.now().microsecondsSinceEpoch,
      'message': value,
    });
  }

  void deleteMessage(String docID) async {
    await FirebaseFirestore.instance
        .collection('announcements')
        .doc(docID)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('announcements')
                        .orderBy('timestamp', descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return /* AdminMessageWall(
                            messages: snapshot.data.docs,
                            onDelete: _deleteMessage,
                            clc: 'announcements',
                          ); */
                            ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  final data = snapshot.data.docs[index].data();
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    child: SlideAnimation(
                                      child: FadeInAnimation(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: GestureDetector(
                                            onLongPress: () async {
                                              await showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    content: Text(
                                                      'Are you sure you want to delete this message ?',
                                                      textScaleFactor: 1.0,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 1,
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: Text(
                                                          "Cancel",
                                                          textScaleFactor: 1.0,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'OpenSans',
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            letterSpacing: 0.5,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      TextButton(
                                                        style: ButtonStyle(
                                                            // overlayColor: Colors.red,
                                                            ),
                                                        child: Text(
                                                          "Delete",
                                                          textScaleFactor: 1.0,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'OpenSans',
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            letterSpacing: 0.5,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          deleteMessage(snapshot
                                                              .data
                                                              .docs[index]
                                                              .id);
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                ),
                                              ),
                                              child: Column(children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  snapshot.data.docs[index]
                                                      ['date'],
                                                  textScaleFactor: 1.0,
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    letterSpacing: 0.5,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 10, 10, 10),
                                                  child: AutoDirection(
                                                    text: snapshot.data
                                                        .docs[index]['message'],
                                                    child: Text(
                                                      snapshot.data.docs[index]
                                                          ['message'],
                                                      textScaleFactor: 1.0,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Tajawal',
                                                        letterSpacing: 0.5,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                              ]),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                      } else {
                        return Center(
                          child: SpinKitRipple(
                            //rgb(17, 45, 78)
                            color: Theme.of(context).primaryColor,
                            size: 25.w,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              GlobalClass.isAdmin == true
                  ? Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: 25, left: 10, top: 25, right: 15),
                          width: 88.w,
                          child: AutoDirection(
                            text: message,
                            child: TextFormField(
                              autofocus: false,
                              controller: _messageController,
                              decoration: InputDecoration(
                                hintText: 'Type a Message',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.all(10),
                              ),
                              minLines: 1,
                              maxLines: 10,
                              onChanged: (value) {
                                setState(() {
                                  message = value;
                                });
                              },
                            ),
                          ),
                        ),
                        message != ''
                            ? GestureDetector(
                                onTap: () {
                                  addMessageToDatabase(message);
                                  setState(() {
                                    _messageController.clear();
                                    FocusScope.of(context).unfocus();
                                    message = '';
                                  });
                                },
                                child: Icon(
                                  Icons.send,
                                  size: 30,
                                  color: Theme.of(context).splashColor,
                                ),
                              )
                            : Icon(
                                Icons.attach_file,
                                size: 30,
                                color: Theme.of(context).splashColor,
                              )
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
