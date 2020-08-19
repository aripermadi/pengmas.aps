part of 'apimodules.dart';


abstract class DataKategori {
  Future<List<Kategoris>> getKategoris();
}

class DataKategoriImpl implements DataKategori {

  @override
  Future<List<Kategoris>> getKategoris() async {
    var params = "ketegoris";
    var response = await http.get(Apiurl.apiURL + params);
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
    var params = "latihans";
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
     var pengguna = "penggunas";
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
     var perintah = "perintahs";
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
     var pertanyaan = "latihans";
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

abstract class DataMateris {
  Future<List<Materis>> getMateri();
}

class DataMaterisImpl implements DataMateris {

  @override
  Future<List<Materis>> getMateris() async {
     var materi = "materis";
    var response = await http.get(Apiurl.apiURL + materi);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Materis> materi = Materis.fromJson(data).materi;
      return materi;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<Materis>> getMateri() {
    // TODO: implement getMateri
    throw UnimplementedError();
  }

}
