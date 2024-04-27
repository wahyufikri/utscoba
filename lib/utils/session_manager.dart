import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager{

  int? value;
  String? idUser, username;

  //simpan session
  Future<void> saveSession(int val, String id, String username) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("value", val);
    sharedPreferences.setString("id", id);
    sharedPreferences.setString("username", username);
  }

  //
  Future getSession() async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    value = sharedPreferences.getInt("value");
    idUser = sharedPreferences.getString("id");
    username = sharedPreferences.getString("username");
    return value;
  }

  //clear session --> untuk logout
  Future clearSession() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}

SessionManager session = SessionManager();