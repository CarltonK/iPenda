import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iPenda/provider/indexNotifier.dart';
import 'package:iPenda/provider/offsetNotifier.dart';
import 'package:iPenda/screens/authentication/main_authentication.dart';
import 'package:iPenda/screens/intro/intro_one.dart';
import 'package:iPenda/screens/intro/intro_three.dart';
import 'package:iPenda/screens/intro/intro_two.dart';
import 'package:iPenda/widgets/pageIndicator.dart';
import 'package:provider/provider.dart';

class Onboard1 extends StatefulWidget {
  @override
  _Onboard1State createState() => _Onboard1State();
}

class _Onboard1State extends State<Onboard1> {
   PageController _pageController;
  int _globalIndex;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _pageController = PageController();
  }

  Widget _introHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            onPressed: () {
             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (BuildContext context) => MainAuthentication()));
            },
            padding: EdgeInsets.all(8),
            child: Text('Skip',
                style: GoogleFonts.quicksand(
                    fontSize: 22, fontWeight: FontWeight.w800)),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OffsetNotifier(_pageController),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
           height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              _introHeader(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                  Provider.of<IndexNotifier>(context, listen: false).index =
                      index;
                  setState(() {
                    _globalIndex = index;
                  });
                },
                children: [IntroOne(), IntroTwo(), IntroThree()],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageIndicator(),
                  ),
                  _globalIndex == 2
                      ? Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: GestureDetector(
                            child: Icon(
                              Icons.arrow_forward_ios,
                            ),
                            onTap: () {
                             // Navigator.push(
                               //   context,
                                 // MaterialPageRoute(
                                   //   builder: (BuildContext context) =>
                                     //     LandingScreen()));
                            },
                          ))
                      : Container()
                ],
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
