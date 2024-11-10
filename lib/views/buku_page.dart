import 'package:flutter/material.dart';
import 'package:perpustakaan/controller/buku_controller.dart';
import 'package:perpustakaan/models/buku.dart';

class BukuPage extends StatefulWidget {
  const BukuPage({super.key});

  @override
  State<BukuPage> createState() => _BukuPageState();
}

class _BukuPageState extends State<BukuPage> {
  BukuController buku = BukuController();
  List<Buku>? bukuu;
  int? buku_id;

  getbukuu() {
    setState(() {
      bukuu = buku.buku;
    });
  }

  addbukuu(data) {
    bukuu!.add(data);
    getbukuu();
  }

  @override
  void initState() {
    super.initState();
    getbukuu();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        title: Text(bukuu![index].judul),
      ),
      body: Text('data'),
    );
  }
}
