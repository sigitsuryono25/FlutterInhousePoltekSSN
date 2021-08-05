import 'package:flutter_basic/models/data.dart';

class ListBerita {

  List<Data> data;
  String message;
  int error;

	ListBerita.fromJsonMap(Map<String, dynamic> map): 
		data = List<Data>.from(map["data"].map((it) => Data.fromJsonMap(it))),
		message = map["message"],
		error = map["error"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['data'] = data != null ? 
			this.data.map((v) => v.toJson()).toList()
			: null;
		data['message'] = message;
		data['error'] = error;
		return data;
	}
}
