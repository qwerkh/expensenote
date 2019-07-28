import 'package:flutter/material.dart';
import 'package:mbpos/src/models/login_model.dart';
import 'package:mbpos/src/screens/dashboard_screen.dart';
import 'package:mbpos/src/screens/product_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../utils/constants.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/colorButton.dart';

class LoginScreen extends StatefulWidget {
  final String title;

  const LoginScreen({Key key, this.title}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginModel _login;
  PageController pageController = PageController();

  @override
  void initState() {
    _login = LoginModel();
    super.initState();
  }

  void _pressLogin(context) {
    Navigator.push(
      context,
      MaterialPageRoute<String>(
        builder: (BuildContext context) => Dashboard(),
      ),
    );
  }

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    return ScopedModel<LoginModel>(
      model: _login,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          scrollDirection: Axis.vertical,
          children: <Widget>[_pageLogin(context), _pageRegister()],
        ),
      ),
    );
  }

  SingleChildScrollView _pageRegister() {
    return SingleChildScrollView(
        child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 100.0, 0.0, 0.0),
                  alignment: Alignment(0.0, 0.0),
                  child: Text(
                    "-------Register-------",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                      fontSize: 35.0,
                      color: Colors.green,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 170.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.account_circle),
                          labelText: "USER NAME",
                          labelStyle: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "EMAIL",
                          icon: Icon(Icons.email),
                          labelStyle: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "PASSWORD",
                          icon: Icon(Icons.lock),
                          labelStyle: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "CONFIRM PASSWORD",
                          icon: Icon(Icons.lock_open),
                          labelStyle: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "PHONE NUMBER",
                          icon: Icon(Icons.phone),
                          labelStyle: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                "REGISTER",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already a memeber?",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () => pageController.animateToPage(0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  SingleChildScrollView _pageLogin(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    "POS",
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                  child: Text(
                    "SYSTEM",
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(320.0, 175.0, 0.0, 0.0),
                  child: Text(
                    ".",
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: "USER / EMAIL",
                    icon: Icon(Icons.account_circle),
                    labelStyle: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: "PASSWORD",
                    labelStyle: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(
                    top: 15.0,
                    left: 20.0,
                  ),
                  child: InkWell(
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                /*Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/ProductScreen');
                      },
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),*/
                /*RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(45),
                    ),
                  ),
                  onPressed: () => _pressLogin(context),
                  child: Text(
                    '                          Login                            ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),*/

                InkWell(
                  onTap: ()=>_pressLogin(context),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        width: 130,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [colorButton1, colorButton2]),
                            boxShadow: [
                              BoxShadow(
                                  color: colorButton1.withOpacity(0.3),
                                  blurRadius: 4,
                                  spreadRadius: 2)
                            ],
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      color: Color(0xffe9eaec),
                      height: 2,
                      width: 100,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Social Login",
                      style: TextStyle(
                          fontFamily: 'Medium',
                          fontSize: 15,
                          color: Color(0xffe9eaec)),
                    ),
                    SizedBox(width: 10),
                    Container(
                      color: Color(0xffe9eaec),
                      height: 2,
                      width: 100,
                    ),
                  ],
                ),
                /*GoogleSignInButton(onPressed: (){}),*/
                /*FacebookSignInButton(onPressed: () {})*/
                /*Container(
                  height: 40.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Center(
                          child: ImageIcon(
                            AssetImage(Constants.images.facebook),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Login with facebook",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )*/
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Image.asset(
                  "assets/images/btp2.png",
                  fit: BoxFit.fill,
                )),
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xff1346b4), Color(0xff0cb2eb)]),
                            shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xffff4645), shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xff0cb2eb), Color(0xff5190e6)]),
                            shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () => pageController.animateToPage(1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff0cb2eb),
                                Color(0xff006ced)
                              ]),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.linkedin,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "New User",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      InkWell(
                        onTap: () => pageController.animateToPage(1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                )

                /*Align(
                  alignment: Alignment.bottomCenter,
                  //padding: const EdgeInsets.only(top: 60,bottom: 20),
                  child: RichText(
                    text: TextSpan(
                      text: 'New User?',
                      style: TextStyle(
                        fontFamily: 'Medium',
                        fontSize: 14,
                        color: Color(0xff3f4b5a),
                      ),
                      children: [
                        TextSpan(
                            text: " Sign Up",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Medium',
                                color: Color(0xff5e75e4)))
                      ],

                    ),
                  ),
                )*/
              ],
            ),
          ),
          /*Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "New to Spotify",
                style: TextStyle(
                  fontFamily: "Montserrat",
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              InkWell(
                onTap: () => pageController.animateToPage(1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn),
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),*/
        ],
      ),
    ));
  }
}
