import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_bar_provider.dart';

// ignore: use_key_in_widget_constructors
class NavigationBarWidget extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<NavigationBarProvider>(context);

    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      iconSize: 30,
      selectedItemColor: Colors.redAccent,
      currentIndex: navigationModel.indexActual,
      onTap: (i) => navigationModel.indexActual = i,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted_rounded), label: "List" ),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites")

      ]
    ,);
  }
}