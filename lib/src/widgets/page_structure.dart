import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_bar_provider.dart';
import 'package:image_gallery_app/src/widgets/list_page/list_page_view.dart';
import 'package:image_gallery_app/src/widgets/fav_page/favorites_page.dart';

// ignore: use_key_in_widget_constructors
class PageStructureWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<NavigationBarProvider>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ListPage(),
        
        FavPage()
      ],
    );
  }
}