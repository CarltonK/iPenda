import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iPenda/models/user_model.dart';
import 'package:iPenda/screens/home/profile/user_profile.dart';
import 'package:iPenda/screens/home/settings/settings_page.dart';
import 'package:iPenda/screens/pricing/pricing_base.dart';
import 'package:iPenda/utilities/global/pageTransitions.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Size _size;

  Widget profileHeader() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Container(
        height: _size.height * 0.4,
        width: _size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.grey,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                      tooltip: 'Notifications',
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      tooltip: 'Exit',
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'John Doe',
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        '22% completed',
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                      Slider(
                        value: 0.22,
                        min: 0,
                        max: 1,
                        inactiveColor: Colors.white70,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    onPressed: () => Navigator.of(context).push(
                      SlideLeftTransition(page: PricingBase()),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    child: Text(
                      'Upgrade to Premium',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget singleOptionTile(IconData leading, String text, Function onTap) {
    return ListTile(
      leading: Icon(leading, color: Colors.black),
      onTap: onTap,
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
    );
  }

  Widget profileOptions() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Column(
        children: [
          singleOptionTile(
            Icons.person,
            'My Profile',
            () {
              final User currentUser = User(
                  id: 0,
                  name: 'Mark',
                  imageUrl:
                      'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80');

              Navigator.of(context).push(
                SlideLeftTransition(
                  page: UserProfile(
                    user: currentUser,
                  ),
                ),
              );
            },
          ),
          singleOptionTile(
            Icons.album,
            'Ideal Match',
            null,
          ),
          singleOptionTile(
            Icons.settings,
            'Settings',
            () => Navigator.of(context).push(
              SlideLeftTransition(page: SettingsPage()),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      color: Colors.white,
      child: Column(
        children: [
          profileHeader(),
          SizedBox(
            height: 20,
          ),
          profileOptions(),
        ],
      ),
    );
  }
}
