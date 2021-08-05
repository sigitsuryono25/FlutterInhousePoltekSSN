
class Data  {

  String id;
  String jdl_news;
  String post_on;
  String nama_kategori;
  String foto_news;
  String judul_seo;

	Data.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		jdl_news = map["jdl_news"],
		post_on = map["post_on"],
		nama_kategori = map["nama_kategori"],
		foto_news = map["foto_news"],
		judul_seo = map["judul_seo"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['jdl_news'] = jdl_news;
		data['post_on'] = post_on;
		data['nama_kategori'] = nama_kategori;
		data['foto_news'] = foto_news;
		data['judul_seo'] = judul_seo;
		return data;
	}
}
