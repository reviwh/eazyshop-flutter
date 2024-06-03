import 'package:eazyshop/data/datasource/pref/search_pref.dart';

class SearchRepository {
  final SearchPreferences _preferences = SearchPreferences();

  Future<List<String>> get() async => await _preferences.get();
  Future<void> add(String value) async => await _preferences.add(value);
  Future<void> remove(String value) async => await _preferences.remove(value);
  Future<void> clear() async => await _preferences.clear();
}
