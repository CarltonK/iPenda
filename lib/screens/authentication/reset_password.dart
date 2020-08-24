import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iPenda/utilities/styles.dart';

class ResetPassword extends StatelessWidget {
  Widget _resetEmailField() {
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

  Widget _resetBtn() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueAccent[200].withOpacity(0.7)),
      child: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onPressed: () => print('I want to login now'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 35,
                ),
                Text(
                  'Forgot Password?',
                  style: headerOutlineBlack,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Enter the email address associated with your account',
                  style: normalOutlineBlack,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                _resetEmailField(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _resetBtn(),
    );
  }
}
