library easy_multilanguage;
import 'package:shared_preferences/shared_preferences.dart';

List<String> languages = [];

String currentLanguage;

String t(String term){
  if(t_table.containsKey(term) == false){
    throw("easy_multilanguage: Term was not found in the dictionary (" + term + ")");}
  if(t_table[term].containsKey(currentLanguage) == false){
    throw("easy_multilanguage: Term was not found in the dictionary (" + term + ") for language " + currentLanguage);}
  return t_table[term][currentLanguage];
}

Future<String> getCurrentLanguage() async {
  return (await SharedPreferences.getInstance()).getString('easylang.currentLanguage');
}

Future<bool> setCurrentLanguage(String newLanguage) async {
  return (await SharedPreferences.getInstance()).setString('easylang.currentLanguage', newLanguage);
}

Future<bool> setDefaultLanguage(String newLanguage) async {
  if((await SharedPreferences.getInstance()).getString('easylang.currentLanguage') == null){
    (await SharedPreferences.getInstance()).setString('easylang.currentLanguage', newLanguage);
    currentLanguage = newLanguage;
    return true;}
  else{
    currentLanguage = (await SharedPreferences.getInstance()).getString('easylang.currentLanguage'); return false;
  }
}

Future<bool> setLanguages(String newLanguage) async {
  return (await SharedPreferences.getInstance()).setString('easylang.currentLanguage', newLanguage);
}

Map t_table = {};