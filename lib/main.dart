import 'package:flutter/material.dart';
import 'package:image_gallery_app/src/providers/image_file.dart';
import 'package:image_gallery_app/src/providers/navigation_bar_provider.dart';

import 'package:image_gallery_app/src/routes/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());
 
class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImageFileProvider()),
        ChangeNotifierProvider(create: (_) => NavigationBarProvider())
      ],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: getAplicationRoutes(),
    );
  }
}