part of 'apiurl.dart';

abstract class DataKategori {
  Future<List<Kategoris>> getKategoris();
}

class DataKategoriImpl implements DataKategori {

  @override
  Future<List<Kategoris>> getKategoris() async {
    var response = await http.get(Apiurl.apiURL);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Kategoris> kategori = Kategoris.fromJson(data).kategori;
      return kategori;
    } else {
      throw Exception();
    }
  }

}

class Kategoris {
  bool success;
  List<Kategoris> kategori;
  String message;

  Kategoris({this.success, this.kategori, this.message});

  Kategoris.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['kategori'] != null) {
      kategori = new List<Kategoris>();
      json['kategori'].forEach((v) {
        kategori.add(new Kategoris.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> kategori = new Map<String, dynamic>();
    kategori['success'] = this.success;
    if (this.kategori != null) {
      kategori['pengguna'] = this.kategori.map((v) => v.toJson()).toList();
    }
    kategori['message'] = this.message;
    return kategori;
  }
}

class Kategori {
  int id;
  String nama;
  String createdAt;
  String updatedAt;

  Kategori({this.id, this.nama, this.createdAt, this.updatedAt});

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}