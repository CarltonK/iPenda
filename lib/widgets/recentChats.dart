import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iPenda/models/message_model.dart';
import 'package:iPenda/screens/chat/chat_screen.dart';
import 'package:iPenda/utilities/global/pageTransitions.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              'Messages',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(left: 10),
              child: ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (BuildContext context, int index) {
                    final chat = chats[index];
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        SlideUpTransition(
                          page: ChatScreen(
                            user: chat.sender,
                          ),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: chat.isRead ? Colors.white : Color(0XFFFFEFEE),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 10.0,
                        ),
                        margin: EdgeInsets.only(
                          top: 5.0,
                          bottom: 5.0,
                          left: 20,
                          right: 5.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 35.0,
                                  backgroundImage:
                                      NetworkImage(chat.sender.imageUrl),
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      chat.sender.name,
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    SizedBox(
                                      height: 6.0,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                        chat.text,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  chat.time,
                                  style: GoogleFonts.quicksand(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                !chat.isRead
                                    ? Container(
                                        width: 40.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'NEW',
                                          style: GoogleFonts.quicksand(
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    : Text(''),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
