import 'dart:convert';

import 'package:flutter_basic/models/DetailResponse.dart';
import 'package:flutter_basic/models/ListBerita.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<ListBerita> fetchData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ListBerita.fromJsonMap(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch data berita");
    }
  }

  Future<DetailResponse> fetchDetailBerita(String url) async{
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return DetailResponse.fromJsonMap(jsonDecode(response.body));
    }else{
      throw Exception("Failed to fetch detail berita");
    }
  }
}
