import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iPenda/provider/indexNotifier.dart';
import 'package:iPenda/provider/offsetNotifier.dart';
import 'package:iPenda/screens/authentication/main_authentication.dart';
import 'package:iPenda/screens/onboarding/intro/intro_one.dart';
import 'package:iPenda/screens/onboarding/intro/intro_three.dart';
import 'package:iPenda/screens/onboarding/intro/intro_two.dart';
import 'package:iPenda/utilities/global/pageTransitions.dart';
import 'package:iPenda/widgets/pageIndicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _pageController;
  int _globalIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    checkFirstSeen();
  }

  // Show Onboarding page only once
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (!_seen) {
      Navigator.of(context).pushReplacement(
        SlideLeftTransition(
          page: MainAuthentication(),
        ),
      );
      await prefs.setBool('seen', true);
    }
  }

  Widget _introHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MainAuthentication(),
                ),
              );
            },
            padding: EdgeInsets.all(8),
            child: Text(
              'Skip',
              style: GoogleFonts.quicksand(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
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
                ),
              ),
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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MainAuthentication(),
                                ),
                              );
                            },
                          ),
                        )
                      : Container()
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
