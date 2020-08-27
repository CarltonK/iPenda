import 'package:flutter/material.dart';
import 'package:iPenda/models/user_model.dart';
import 'package:iPenda/utilities/global/pageTransitions.dart';
import 'package:iPenda/screens/chat/chat_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
  final User user;
  UserProfile({@required this.user});

  Widget appBar(BuildContext context) {
    return AppBar(
      // centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      // title: Text(
      //   'Match',
      //   style: Theme.of(context).textTheme.headline1,
      // ),
    );
  }

  Widget bodyContainer(BuildContext context, Size size) {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        image: DecorationImage(
          image: NetworkImage(
            user.imageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget userIdentity(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}, 24',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Student',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        IconButton(
          icon: user.id == 0 ? Icon(Icons.edit) : Icon(Icons.message),
          color: Theme.of(context).primaryColor,
          tooltip: user.id == 0 ? 'Edit Profile' : 'Send a message',
          onPressed: () => Navigator.of(context).push(
            SlideLeftTransition(
              page: ChatScreen(
                user: user,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget singlePhoto() {
    return Container(
      height: 160,
      width: 160,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(user.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget photosList() {
    return Container(
      width: double.infinity,
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          singlePhoto(),
          singlePhoto(),
          singlePhoto(),
        ],
      ),
    );
  }

  Widget locationDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New York',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '3KM away from you',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget aboutDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Widget scrollableSheet(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
            child: ListView(
              controller: scrollController,
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 5,
              ),
              children: [
                Center(
                  child: Container(
                    height: 10,
                    width: 60,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                userIdentity(context),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey,
                  indent: 5,
                  endIndent: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                photosList(),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.grey,
                  indent: 5,
                  endIndent: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                locationDetails(context),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.grey,
                  indent: 5,
                  endIndent: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                aboutDetails(context),
                SizedBox(
                  height: 20,
                ),
                // MaterialButton(
                //   onPressed: () {},
                //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //   color: Theme.of(context).primaryColor,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   padding: EdgeInsets.all(10),
                //   child: Text(
                //     'Send a Message',
                //     style: GoogleFonts.quicksand(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 20,
                //       color: Colors.white,
                //       letterSpacing: 1,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          bodyContainer(context, size),
          scrollableSheet(context),
        ],
      ),
    );
  }
}
