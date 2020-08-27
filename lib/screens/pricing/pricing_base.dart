import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PricingBase extends StatefulWidget {
  @override
  _PricingBaseState createState() => _PricingBaseState();
}

class _PricingBaseState extends State<PricingBase> {
  Color color;
  Size size;
  final int _numPages = 3;
  int _currentPage = 0;
  Duration duration = Duration(milliseconds: 500);
  CarouselController _carouselController = CarouselController();

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.grey,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Choose your plan',
        style: Theme.of(context).textTheme.headline4,
      ),
      leading: IconButton(
        icon: Icon(
          Icons.cancel,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget subscribeButton() {
    return MaterialButton(
      onPressed: () {},
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Text(
        'Upgrade',
        style: GoogleFonts.quicksand(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 16 : 12,
      width: isActive ? 16 : 12,
      decoration: BoxDecoration(
        color: isActive ? color : Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageIndicator(),
    );
  }

  List<Color> colors = [
    Colors.pink,
    Colors.red,
    Colors.green,
  ];

  Widget containerPrice() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/onboarding/date.png',
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '200 KES',
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.black,
              letterSpacing: 2,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Weekly Premium',
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black,
              letterSpacing: 1,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'This is the cheapest option. Let\'s help you find your partner on a budget',
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(),
          )
        ],
      ),
    );
  }

  Widget mainBody() {
    return Expanded(
      child: CarouselSlider(
        items: [
          containerPrice(),
          containerPrice(),
          containerPrice(),
        ],
        options: CarouselOptions(
          height: size.height * 0.6,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: duration,
          autoPlayCurve: Curves.fastOutSlowIn,
          initialPage: 0,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              _currentPage = index;
              color = colors[_currentPage];
            });
          },
          scrollDirection: Axis.horizontal,
        ),
        carouselController: _carouselController,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    color = colors[_currentPage];
    return Scaffold(
      appBar: appBar(),
      body: AnimatedContainer(
        duration: duration,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey,
              Colors.white,
            ],
            stops: [0, 0.95],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            mainBody(),
            SizedBox(height: 20),
            indicator(),
            SizedBox(height: 20),
            subscribeButton(),
          ],
        ),
      ),
    );
  }
}
