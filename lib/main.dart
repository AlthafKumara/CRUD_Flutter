import 'package:flutter/material.dart';
import 'package:perpustakaan/views/buku_page.dart';
import 'package:perpustakaan/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context)=>HomePage(),
        '/buku':(context) =>BukuPage(),
      },
    );
  }
}
