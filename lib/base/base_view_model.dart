import 'package:flutter/material.dart';

enum NotifierState { loading, loaded }

class BaseViewModel with ChangeNotifier {


  NotifierState _state = NotifierState.loading;
  NotifierState get state => _state;

  void setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }
}
