import 'package:flutter/material.dart';

class ModalWidget {
  showFullModal(context, Widget isi) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel: "Modal",
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (_, __, ___,) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
              title: Text(
                "Tambah Buku",
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Overpass',
                    fontSize: 20),
              ),
              elevation: 0.0,
            ),
            backgroundColor: Colors.white.withOpacity(0.90),
            body: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: const Color(0xfff8f8f8), width: 1))),
              child: isi,
            ),
          );
        });
  }
}
