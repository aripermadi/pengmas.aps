
part of 'apiurl.dart';

abstract class DataPengguna {
  Future<List<Penggunas>> getPengguna();
}

class DataPenggunaImpl implements DataPengguna {

  @override
  Future<List<Penggunas>> getPengguna() async {
    var response = await http.get(Apiurl.apiURL);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Penggunas> pengguna = Penggunas.fromJson(data).pengguna;
      return pengguna;
    } else {
      throw Exception();
    }
  }

}


class Penggunas {
  bool success;
  String message;
  List<Penggunas> pengguna;
  Penggunas({this.success, this.pengguna, this.message});

  Penggunas.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['pengguna'] != null) {
      pengguna = new List<Penggunas>();
      json['pengguna'].forEach((v) {
        pengguna.add(new Penggunas.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> pengguna = new Map<String, dynamic>();
    pengguna['success'] = this.success;
    if (this.pengguna != null) {
      pengguna['data'] = this.pengguna.map((v) => v.toJson()).toList();
    }
    pengguna['message'] = this.message;
    return pengguna;
  }
}

class Pengguna {
  int id;
  String nama;
  String email;
  String password;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  Pengguna(
      {this.id,
      this.nama,
      this.email,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Pengguna.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    email = json['email'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  get userId => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['email'] = this.email;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}