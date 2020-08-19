
part of 'apiurl.dart';

abstract class DataLatihan {
 Future<List<Latihans>> getLatihans();
}

class DataLatihanImpl implements DataLatihan {
  
  @override
  Future<List<Latihans>> getLatihans() async {
    var params = "latihans/post";
    var response = await http.get(Apiurl.apiURL+params);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Latihans> latihan = Latihans.fromJson(data).latihan;
      return latihan;
    } else {
      throw Exception();
    }
  }

}


class Latihans {
  bool success;
  List<Data> data;
  List<Latihans> latihan;
  String message;

  Latihans({this.success, this.data, this.message});

  Latihans.fromJson(Map<String, dynamic> json) {
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

class Latihan {
  int id;
  String panduan;
  String urlGambar;
  Null urlAudio;
  String urlVideo;
  int idMateri;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  Latihan(
      {this.id,
      this.panduan,
      this.urlGambar,
      this.urlAudio,
      this.urlVideo,
      this.idMateri,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Latihan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    panduan = json['panduan'];
    urlGambar = json['url_gambar'];
    urlAudio = json['url_audio'];
    urlVideo = json['url_video'];
    idMateri = json['id_materi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['panduan'] = this.panduan;
    data['url_gambar'] = this.urlGambar;
    data['url_audio'] = this.urlAudio;
    data['url_video'] = this.urlVideo;
    data['id_materi'] = this.idMateri;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}