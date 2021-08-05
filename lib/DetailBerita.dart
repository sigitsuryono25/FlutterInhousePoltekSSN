import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/models/DetailResponse.dart';
import 'package:flutter_basic/models/data.dart';
import 'package:flutter_html/flutter_html.dart';

import 'libs/Services.dart';

class DetailBerita extends StatefulWidget {
  DetailBerita({required this.data});

  final Data data;

  @override
  State<StatefulWidget> createState() => _detailBeritaState();
}

class _detailBeritaState extends State<DetailBerita> {
  late Future<DetailResponse> _daftarBerita;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetail(widget.data.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Berita"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
            future: _daftarBerita,
            builder: (context, AsyncSnapshot<DetailResponse> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.jdl_news,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(snapshot.data!.post_on),
                    Image.network(
                      snapshot.data!.foto_news,
                      loadingBuilder: (context, child, loading) {
                        if (loading == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                    Html(
                      data: snapshot.data!.ket_news,
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void getDetail(String id) {
    var services = Services();
    _daftarBerita = services.fetchDetailBerita(
        "https://lauwba.com/webservices/get_detail_news/${id}");
  }
}
