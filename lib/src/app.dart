import 'package:flutter/material.dart';
import 'package:mbpos/src/screens/dashboard_screen.dart';
import 'package:mbpos/src/screens/product_screen.dart';
import '../src/screens/login_screen.dart';
//import 'bloc/login_provider.dart';
import '../src/scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import '../utils/localization/constants.dart' show languages;

class App extends StatefulWidget {
  final Map<String, Map<String, String>> localizedValues;

  const App({Key key, @required this.localizedValues}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final MainScopedModel _model = MainScopedModel();
  final supportedLocales = languages.map((language) => Locale(language, ''));

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainScopedModel>(
      model: _model,
      child: MaterialApp(
          title: "Login",
          debugShowCheckedModeBanner: false,
          initialRoute: '/login',
          routes: {
            "/login": (BuildContext context) => LoginScreen(),
            "/product": (BuildContext context) => ProductScreen()
          },
          home: Dashboard()),
    );
  }
}
