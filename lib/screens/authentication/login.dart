import 'package:flutter/material.dart';
import 'package:iPenda/screens/authentication/reset_password.dart';
import 'package:iPenda/screens/home/home_base.dart';
import 'package:iPenda/utilities/global/pageTransitions.dart';
import 'package:iPenda/utilities/global/social_buttons.dart';
import 'package:iPenda/utilities/styles.dart';

class LoginPage extends StatelessWidget {
  Widget _introText() {
    return Text(
      'Welcome',
      style: headerOutlineBlack,
    );
  }

  final FocusNode focusPassword = FocusNode();

  Widget _loginEmailField(BuildContext context) {
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
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(focusPassword);
      },
      decoration: InputDecoration(labelText: 'Email address'),
    );
  }

  Widget _loginPasswordField(BuildContext context) {
    return TextFormField(
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
      focusNode: focusPassword,
      onFieldSubmitted: (value) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(labelText: 'Password'),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 15,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueAccent[200].withOpacity(0.7),
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).push(
            SlideUpTransition(
              page: HomeBase(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: FlatButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ResetPassword(),
          ),
        ),
        child: Text(
          'Forgot Password ?',
          style: normalOutlineBlack,
        ),
      ),
    );
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
                  height: 30,
                ),
                _introText(),
                SizedBox(
                  height: 30,
                ),
                _loginEmailField(context),
                SizedBox(
                  height: 20,
                ),
                _loginPasswordField(context),
                SocialButtons()
              ],
            ),
          ),
          _forgotPasswordButton(context),
          _loginButton(context)
        ],
      ),
    );
  }
}
