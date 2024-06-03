import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SearchPreferences {
  static const List<String> searched = [];

  Future<void> add(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> searched = await get();
    searched.add(value);
    await prefs.setStringList("searched", searched);
  }

  Future<void> remove(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> searched = await get();
    searched.remove(value);
    await prefs.setStringList("searched", searched);
  }

  Future<void> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> searched = await get();
    searched.clear();
    await prefs.setStringList("searched", searched);
  }

  Future<List<String>> get() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? data = prefs.getStringList("searched");
    return data ?? [];
  }
}
