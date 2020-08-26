import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iPenda/models/message_model.dart';
import 'package:iPenda/models/user_model.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<User> _users = favorites;
  var _width, _height;
  PageController _pageController;
  var currentPage = 0.0;

  Widget swipeOptionButton(IconData icon, Color color, Function onTap) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.all(1),
      alignment: Alignment.center,
      iconSize: 50,
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }

  Widget mainBody() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Stack(
          fit: StackFit.expand,
          children: [_userList()],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page + 1;
      });
    });
    return Container(
      padding: const EdgeInsets.only(top: 40.0, bottom: 20),
      height: size.height,
      width: double.infinity,
      child: Column(
        children: [
          Text('iPenda', style: Theme.of(context).textTheme.headline1),
          mainBody(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              swipeOptionButton(
                CupertinoIcons.clear_circled,
                Colors.yellow[700],
                () {
                  setState(() {
                    currentPage++;
                  });
                },
              ),
              swipeOptionButton(
                CupertinoIcons.heart_solid,
                Colors.red.withOpacity(0.75),
                () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _userList() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _usersStack(),
        PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            return Container();
          },
          itemCount: _users.length,
        ),
      ],
    );
  }

  Widget _usersStack() {
    List<Widget> _usersList = [];
    for (int i = _users.length - 1; i >= 0; i--) {
      var sizeOffset = (15.0 * i) - (currentPage * 15);
      var topOffset = (15.0 * i) - (currentPage * 15);
      _usersList.add(
        Positioned.fill(
          top: topOffset,
          left: currentPage > (i) ? -(currentPage - i) * (_width * 4) : 0,
          child: _userCard(
            _users[i],
            _width - sizeOffset,
            _height - sizeOffset,
          ),
        ),
      );
    }
    return Stack(
      children: _usersList,
    );
  }

  Widget _userCard(User one, double width, double height) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: width * .8,
        height: height * .8,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: height * .6,
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                    one.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
