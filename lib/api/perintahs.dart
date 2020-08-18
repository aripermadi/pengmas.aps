
part of 'apiurl.dart';

abstract class DataPerintahs {
  Future<List<Perintahs>> getPerintahs();
}

class DataperintahsImpl implements DataPerintahs {

  @override
  Future<List<Perintahs>> getPerintahs() async {
    var response = await http.get(Apiurl.apiURL);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Perintahs> perintahs = Perintahs.fromJson(data).perintahs;
      return perintahs;
    } else {
      throw Exception();
    }
  }

}

class Perintahs {
  bool success;
  List<Data> data;
  List<Perintahs> perintahs;
  String message;

  Perintahs({this.success, this.data, this.message});

  Perintahs.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Datas {
  int id;
  String nama;
  int idMateri;
  String keterangan;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  Datas(
      {this.id,
      this.nama,
      this.idMateri,
      this.keterangan,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Datas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    idMateri = json['id_materi'];
    keterangan = json['keterangan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['id_materi'] = this.idMateri;
    data['keterangan'] = this.keterangan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}