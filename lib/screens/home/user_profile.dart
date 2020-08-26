import 'package:flutter/material.dart';
import 'package:iPenda/models/user_model.dart';

class UserProfile extends StatelessWidget {
  final User user;
  UserProfile({@required this.user});

  Widget appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        'Match',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget backgroundContainer() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
    );
  }

  Widget bodyContainer(BuildContext context, Size size) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context),
      body: Stack(
        children: [
          backgroundContainer(),
          bodyContainer(context, size),
        ],
      ),
    );
  }
}
