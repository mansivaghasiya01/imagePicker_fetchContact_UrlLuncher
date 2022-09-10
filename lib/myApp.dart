// ignore_for_file: file_names

import 'package:fetchcontact_imagepicker_urlluncher/view/fetch_contact.dart';
import 'package:fetchcontact_imagepicker_urlluncher/view/share_app.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FetchConatctView(),
    );
  }
}
