import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  Widget singleOptionTile(IconData leading, String text, Function onTap) {
    return ListTile(
      leading: Icon(leading, color: Colors.black),
      onTap: onTap,
      title: Text(
        text,
        style: GoogleFonts.quicksand(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
    );
  }

  Widget faqExpansion() {
    return ExpansionTile(
      leading: Icon(Icons.question_answer, color: Colors.black),
      title: Text(
        'FAQ',
        style: GoogleFonts.quicksand(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black,
        size: 35,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: GoogleFonts.quicksand(),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          faqExpansion(),
          singleOptionTile(Icons.share, 'Invite', null),
          singleOptionTile(Icons.web, 'Privacy Policy', null),
          singleOptionTile(Icons.web, 'Terms of service', null),
          singleOptionTile(Icons.vpn_key, 'Change Password', null),
          singleOptionTile(Icons.contact_phone, 'Contact Support', null),
          singleOptionTile(CupertinoIcons.person_solid, 'Developer', null),
        ],
      ),
    );
  }
}
