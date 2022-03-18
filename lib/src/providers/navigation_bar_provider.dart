import 'package:flutter/material.dart';

class NavigationBarProvider with ChangeNotifier{

  int _indexActual = 0;
  
  final PageController _pageController = PageController();


  int get indexActual => _indexActual;

  set indexActual(int value){
    _indexActual = value;

    _pageController.animateToPage(value, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);

    notifyListeners();
  }
  
  PageController get pageController => _pageController;
}
