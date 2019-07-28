import 'package:scoped_model/scoped_model.dart';
import './scoded_language.dart';

class MainScopedModel extends Model with LanguageScopedModel {
  bool _isLoading = false;

  set loading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
}
