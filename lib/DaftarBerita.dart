import 'package:flutter/material.dart';
import 'package:flutter_basic/DetailBerita.dart';
import 'package:flutter_basic/libs/Services.dart';
import 'package:flutter_basic/models/ListBerita.dart';

void main() => runApp(DaftarBerita());

class DaftarBerita extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateDaftarBerita();
  }
}

class _StateDaftarBerita extends State {
  late Future<ListBerita> berita;

  //pertama dipanggil
  @override
  void initState() {
    super.initState();

    berita =
        Services().fetchData('https://lauwba.com/webservices/get_latest_news');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Berita Terbaru Lauwba",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Berita Terbaru Lauwba"),
        ),
        body: Container(
          padding: EdgeInsets.all(4.0),
          child: Center(
            child: FutureBuilder<ListBerita>(
              future: berita,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return listViewBuilder(snapshot);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget listViewBuilder(AsyncSnapshot<ListBerita> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data!.data.length,
      itemBuilder: (context, index) {
        //pake gesturedetector untuk kasih klik ke elemen yang nggak punya ontap
        return GestureDetector(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailBerita(data: snapshot.data!.data[index])))
          },
          child: Row(
            children: [
              Image.network(
                snapshot.data!.data[index].foto_news,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    //kalo colums, buat gravity horizontal pake crossaxis
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(snapshot.data!.data[index].jdl_news),
                      Text(snapshot.data!.data[index].post_on),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
