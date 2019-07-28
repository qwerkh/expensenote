import 'package:scoped_model/scoped_model.dart';

mixin LanguageScopedModel on Model {
  String _locale = 'en';

  void onChangeLanguage() {
    _locale = _locale == 'en' ? 'km' : 'en';
    notifyListeners();
  }

  String get locale => _locale;
}
