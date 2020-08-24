import 'package:flutter/material.dart';
import 'package:iPenda/widgets/newMatches.dart';
import 'package:iPenda/widgets/recentChats.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NewMatches(),
          Expanded(child: RecentChats()),
        ],
      ),
    );
  }
}
