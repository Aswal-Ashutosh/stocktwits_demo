import 'package:flutter/material.dart';

class User{
  final _userName;
  final _userId;
  final _accessToken;
  User({@required String? userId, @required String? userName, @required String? accessToken}): _userId = userId, _userName = userName, _accessToken = accessToken;

  String get userName => this._userName;
  String get userId => this._userId;
  String get accessToken => this._accessToken;
}