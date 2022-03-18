import 'package:flutter/material.dart';

import '../pages/home_page.dart';



Map<String, WidgetBuilder> getAplicationRoutes(){

  return <String, WidgetBuilder> {
        'home'                  : (BuildContext context) => HomePage(),

      };

}