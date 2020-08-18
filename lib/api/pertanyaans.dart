part of 'apiurl.dart';

abstract class DataPertanyaans {
  Future<List<Pertanyaans>> getPertanyaans();
}

class DataPertanyansImpl implements DataPertanyaans {

  @override
  Future<List<Pertanyaans>> getPertanyaans() async {
    var response = await http.get(Apiurl.apiURL);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Pertanyaans> pertanyaan = Pertanyaans.fromJson(data).pertanyaan;
      return pertanyaan;
    } else {
      throw Exception();
    }
  }

}


class Pertanyaans {
  bool success;
  List<Data> data;
  String message;
  List<Pertanyaans> pertanyaan;

  Pertanyaans({this.success, this.data, this.message});

  Pertanyaans.fromJson(Map<String, dynamic> json) {
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

class Data {
  int id;
  int idLatihan;
  String pertanyaan;
  String pilihan1;
  String pilihan2;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  Data(
      {this.id,
      this.idLatihan,
      this.pertanyaan,
      this.pilihan1,
      this.pilihan2,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLatihan = json['id_latihan'];
    pertanyaan = json['pertanyaan'];
    pilihan1 = json['pilihan1'];
    pilihan2 = json['pilihan2'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_latihan'] = this.idLatihan;
    data['pertanyaan'] = this.pertanyaan;
    data['pilihan1'] = this.pilihan1;
    data['pilihan2'] = this.pilihan2;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}