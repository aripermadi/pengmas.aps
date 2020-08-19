import 'dart:convert';

import 'package:project1/api/apiurl.dart';
import 'package:http/http.dart' as http;


abstract class DataKategori {
  Future<List<Kategoris>> postKategoris();
}

class DataKategoriImpl implements DataKategori {

  @override
  Future<List<Kategoris>> postKategoris() async {
    var params = "ketegoris/post";
    var response = await http.post(Apiurl.apiURL + params);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Kategoris> kategori = Kategoris.fromJson(data).kategori;
      return kategori;
    } else {
      throw Exception();
    }
  }

}



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

abstract class DataPengguna {
  Future<List<Penggunas>> getPengguna();
}

class DataPenggunaImpl implements DataPengguna {

  @override
  Future<List<Penggunas>> getPengguna() async {
     var pengguna = "penggunas/post";
    var response = await http.get(Apiurl.apiURL + pengguna);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Penggunas> pengguna = Penggunas.fromJson(data).pengguna;
      return pengguna;
    } else {
      throw Exception();
    }
  }

}

abstract class DataPerintahs {
  Future<List<Perintahs>> getPerintahs();
}

class DataperintahsImpl implements DataPerintahs {

  @override
  Future<List<Perintahs>> getPerintahs() async {
     var perintah = "perintahs/post";
    var response = await http.get(Apiurl.apiURL + perintah);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Perintahs> perintahs = Perintahs.fromJson(data).perintahs;
      return perintahs;
    } else {
      throw Exception();
    }
  }

}

abstract class DataPertanyaans {
  Future<List<Pertanyaans>> getPertanyaans();
}

class DataPertanyansImpl implements DataPertanyaans {

  @override
  Future<List<Pertanyaans>> getPertanyaans() async {
     var pertanyaan = "latihans/post";
    var response = await http.get(Apiurl.apiURL + pertanyaan);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Pertanyaans> pertanyaan = Pertanyaans.fromJson(data).pertanyaan;
      return pertanyaan;
    } else {
      throw Exception();
    }
  }

}
