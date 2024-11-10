import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perpustakaan/controller/buku_controller.dart';
import 'package:perpustakaan/models/buku.dart';
import 'package:perpustakaan/widget/modal_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BukuController buku = BukuController();
  TextEditingController judulbuku = TextEditingController();
  TextEditingController deskripsibuku = TextEditingController();
  TextEditingController sampulbuku = TextEditingController();
  TextEditingController penerbitbuku = TextEditingController();
  TextEditingController stokbuku = TextEditingController();
  List<Buku>? bukuu;
  int? buku_id;

  final formKey = GlobalKey<FormState>();
  ModalWidget modal = ModalWidget();

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
          foregroundColor: Colors.black,
          title: Text(
            "Perpustakaan Digital",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    buku_id = null;
                  });
                  judulbuku.text = '';
                  deskripsibuku.text = '';
                  sampulbuku.text = '';
                  penerbitbuku.text = '';
                  stokbuku.text = '';
                  modal.showFullModal(context, fromTambah(null));
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: bukuu != null
            ? Padding(
                padding: EdgeInsets.all(15),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 15,
                        childAspectRatio: 4 / 7),
                    itemCount: bukuu!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.grey.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              bukuu![index].sampul,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('JUDUL : '),
                            Text(
                              bukuu![index].judul,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Expanded(
                                child: Text(
                              bukuu![index].deskripsi,
                              maxLines: 3,
                              style: TextStyle(color: Colors.grey.shade400),
                              overflow: TextOverflow.ellipsis,
                            )),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(Colors.amber)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/buku');
                                },
                                child: Text(
                                  'Baca Disini',
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ),
                      );
                    }),
              )
            : Text('Data kosong'));
  }

  Widget fromTambah(index) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text("Tambah Data"),
          TextFormField(
            controller: judulbuku,
            decoration: InputDecoration(label: Text("Masukkan judul buku:")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: sampulbuku,
            decoration: InputDecoration(label: Text("Masukkan Sampul Buku :")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: deskripsibuku,
            decoration:
                InputDecoration(label: Text("Masukkan deskripsi buku :")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: penerbitbuku,
            decoration:
                InputDecoration(label: Text("Masukkan penerbit buku :")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: stokbuku,
            decoration: InputDecoration(label: Text("Masukkan stok buku :")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (index != null) {
                    bukuu![index].id = buku_id!;
                    bukuu![index].judul = judulbuku.text;
                    bukuu![index].sampul = sampulbuku.text;
                    bukuu![index].deskripsi = deskripsibuku.text;
                    bukuu![index].penerbit = penerbitbuku.text;
                    bukuu![index].stok = int.parse(stokbuku.text);
                    getbukuu();
                  } else {
                    buku_id = bukuu!.length + 1;
                    Buku data = Buku(
                      id: buku_id!,
                      judul: judulbuku.text,
                      sampul: sampulbuku.text,
                      deskripsi: deskripsibuku.text,
                      penerbit: penerbitbuku.text,
                      stok: int.parse(stokbuku.text),
                    );
                    addbukuu(data);
                  }
                  Navigator.pop(context);
                }
              },
              child: Text("Simpan"))
        ],
      ),
    );
  }
}
