import '../generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class FavoriteSetting with ChangeNotifier {
  String language;
  bool isObscurePassword;

  List<String> languages = ["English", "Arabic"];
  bool isShowLanguageList = false;
  Map languagesToLocal = {"English": "en_US", "Arabic": "ar_SY"};

  TextDirection textDirectionApp = TextDirection.ltr;
  FavoriteSetting() {
    language = "English";
    textDirectionApp = TextDirection.ltr;
    isObscurePassword = true;
  }
/*
  Future<String> getAppLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('language')) {
      language = (prefs.getString('language') ?? "English");
    } else {
      language = "English";
    }
    return language;
  }*/

  void changeLanguage(String selectedLanguage) {
    language = selectedLanguage;
    S.load(Locale(languagesToLocal[selectedLanguage]));
    language == "Arabic"
        ? textDirectionApp = TextDirection.rtl
        : textDirectionApp = TextDirection.ltr;
    notifyListeners();
  }

  void showLanguages() {
    isShowLanguageList = !isShowLanguageList;

    notifyListeners();
  }

  void changeVisabilityOfPassword() {
    isObscurePassword = !isObscurePassword;
    notifyListeners();
  }

  bool getisObscurePassword() {
    return isObscurePassword;
  }
}
