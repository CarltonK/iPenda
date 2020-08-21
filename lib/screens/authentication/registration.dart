import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iPenda/utilities/global/social_buttons.dart';
import 'package:iPenda/utilities/styles.dart';


class SignUpPage extends StatelessWidget {
  Widget _introText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Hello,',
          style: headerOutlineBlack,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Enter your information below\nor login with a social account',
          style: normalOutlineBlack,
        )
      ],
    );
  }

    Widget _registerNameField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please provide your name';
        }
        return null;
      },
      decoration: InputDecoration(labelText: 'Name'),
    );
  }

  Widget _registerEmailField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please provide an email address';
        }
        if (!value.contains('@') || !value.contains('.')) {
          return 'Please provide a valid email address';
        }
        return null;
      },
      decoration: InputDecoration(labelText: 'Email address'),
    );
  }

  Widget _registerPasswordField() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please provide a password';
        }
        if (value.length < 7) {
          return 'Password is too short';
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(labelText: 'Password'),
    );
  }

  Widget _registerButton() {
    return Positioned(
        bottom: 20,
        right: 15,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.pink[200]),
          child: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            onPressed: () => print('I want to register now'),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                _introText(),
                SizedBox(
                  height: 50,
                ),
                _registerNameField(),
                SizedBox(
                  height: 20,
                ),
                _registerEmailField(),
                SizedBox(
                  height: 20,
                ),
                _registerPasswordField(),
                SizedBox(
                  height: 20,
                ),
                _registerPasswordField(),
                SocialButtons(),
                RichText(
                  textAlign: TextAlign.center,
                  text: 
                  TextSpan(
                    children: [
                      TextSpan(text: 'By creating an account you agree to the ',
                      style: GoogleFonts.quicksand(fontSize: 18, 
                      fontWeight: FontWeight.w400, color: Colors.black)
                      ),
                      TextSpan(text: 'Terms ',
                      style: GoogleFonts.quicksand(fontSize: 16, 
                      fontWeight: FontWeight.w400, color: Colors.pink)
                      ),
                      TextSpan(text: 'and ',
                      style: GoogleFonts.quicksand(fontSize: 16, 
                      fontWeight: FontWeight.w400, color: Colors.black )
                      ),    
                      TextSpan(text: 'Privacy Policy',
                      style: GoogleFonts.quicksand(fontSize: 16, 
                      fontWeight: FontWeight.w400, color: Colors.pink)
                      ),                                                              
                    ]
                  )
                )
              ],
            ),
          ),
          _registerButton()
        ],
      ),
    );
  }
}
