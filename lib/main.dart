import 'package:flutter/material.dart';
import 'homepage.dart';  // Import halaman HomePage

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),  // Menampilkan HomePage sebagai halaman utama
    );
  }
}
