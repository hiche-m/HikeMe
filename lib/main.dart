import 'package:flutter/material.dart';
import 'package:hikeme/Pages/home.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Tajawal'),
    ),
  );
}
