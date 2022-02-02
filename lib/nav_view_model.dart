import 'package:flutter/material.dart';

class NavViewModel extends ChangeNotifier {

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

    void onItemTapped(int index) {
      _selectedIndex = index;
      notifyListeners();
  }

}