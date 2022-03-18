import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/navigation_bar_provider.dart';

import '../widgets/page_structure.dart';
import '../widgets/navigation_bar.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationBarProvider(),
      child: Scaffold(
        body: PageStructureWidget(),
        bottomNavigationBar: NavigationBarWidget(),
      ),
    );
  }
}





