import 'package:flutter/material.dart';
import 'package:mesa_news_projeto/exp_arq.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => UserWelcomeScreen(),
      '/news_feed': (context) =>
          NewsFeedScreen(ModalRoute.of(context).settings.arguments),
      '/user_welcome': (context) => UserWelcomeScreen(),
      '/user': (context) => UserScreen(),
    },
  ));
}
