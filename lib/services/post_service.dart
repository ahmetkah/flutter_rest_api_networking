import 'dart:convert';

import 'package:http/http.dart' as http;

import '/models/models.dart';

/// HTTP GET Metodu ile oluşturulan üç farklı metotun yer aldığı servis sınıfı
class PostService {
  /// Tam URL: https://jsonplaceholder.typicode.com/posts
  final _authority = 'jsonplaceholder.typicode.com';
  final _pathPosts = 'posts';

  /// Gönderilen HTTP isteğinin header'ının veri tipinin
  /// 'application/json' biçiminde olduğunu belirtiyoruz.
  final _requestHeaders = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  /// A-1) Tüm Posts verilerini getiren GET metodu
  Future<List<Post>> getPosts() async {
    /// Http metodunun ilk parametresine vereceğimiz istek atılacak olan
    /// url adresimizi Uri tipine dönüştürelim
    final _urlPosts = Uri.https(_authority, _pathPosts);

    /// HTTP GET metodunu kullanarak bir İstek(Request)'te bulunuyoruz.
    /// Bu isteğe karşılık REST API'den gelecek olan Yanıt(Response)'ı
    /// _response isimli değişkene atıyoruz.
    final _response = await http.get(_urlPosts, headers: _requestHeaders);

    /// 1) JSON Array[] To String:
    /// Gelen Yanıt (Response)'ın body'si bize String olarak döner.
    final _respondeBody = _response.body;

    /// 2) String To List<dynamic>:
    /// String verileri dart:convert kütüphanesinde yer alan
    /// jsonDecode() metodu yardımıyla List olarak ayrıştırdık (parse ettik)
    /// Neden List?: REST API'den dönen veri bir JSON Array[] olduğu için
    final List _decodedBody = jsonDecode(_respondeBody);

    /// 3-A) List<dynamic> To Iterable<Post>:
    /// Ayrıştırılan List<dynamic> tipindeki verileri
    /// map() metodu ile Iterable<Post> tipine ve
    /// fromJson() metoduyla da Dart nesnesine dönüştürdük.
    final _iterable = _decodedBody.map((e) => Post.fromJson(e));

    /// 3-B) Iterable<Post> To List<Post>:
    /// from() metodu ile Iterable<Post>'tan
    /// veri tipi List<Post> olan yeni bir liste oluşturduk.
    final _listPosts = List<Post>.from(_iterable);

    /// Dönen Yanıt (Response) kodu 2XX: Başarılı Cevap Kodlarından olan
    /// 200 OK (Tamam) ise yani yanıt başarılı bir şekilde geri döndüyse
    if (_response.statusCode == 200) {
      /// _listPosts'u döndür.
      /// Dikkat: Burada dönen veri tipi ile asenkron metodun veri tipi aynı olmalı.
      /// Yani her ikiside List<Post>> tipinde olmalılar
      return _listPosts;
    } else {
      /// Status Code 200'den farklı ise
      /// bir Exception hatası fırlat.
      throw Exception(
        'Veriler alınamadı. Hata Kodu: ${_response.statusCode}',
      );
    }
  }

  /// A-2) ID değerine ait olan Post verisini getiren GET metodu
  Future<Post> getPostWithId(int id) async {
    /// Tam URL: https://jsonplaceholder.typicode.com/posts/{id}
    final _pathById = 'posts/$id';

    final _urlPostById = Uri.https(_authority, _pathById);

    final _response = await http.get(_urlPostById, headers: _requestHeaders);

    /// 1) JSON Object{} To String:
    final _respondeBody = _response.body;

    /// 2) String To Map<String, dynamic>:
    /// String verileri dart:convert kütüphanesinde yer alan
    /// jsonDecode() metodu yardımıyla Map olarak ayrıştırdık (parse ettik)
    /// Neden Map?: REST API'den dönen veri bir JSON Object{} olduğu için
    final Map<String, dynamic> _decodedBody = jsonDecode(_respondeBody);

    /// 3) Map<String, dynamic> To Post:
    /// Ayrıştırılan Map tipindeki verileri fromJson() metodu ile
    /// Post veri tipinde Dart nesnesine dönüştürdük.
    final _post = Post.fromJson(_decodedBody);

    if (_response.statusCode == 200) {
      /// _post'u döndür.
      /// Dikkat: Burada dönen veri tipi ile asenkron metodun veri tipi aynı olmalı.
      /// Yani her ikiside Post tipinde olmalılar
      return _post;
    } else {
      throw Exception(
        'Veriler alınamadı. Hata Kodu: ${_response.statusCode}',
      );
    }
  }

  /// A-3) userId değerine ait olan Posts verilerini getiren GET metodu
  Future<List<Post>> getPostsWithQueryUserId(int userId) async {
    /// Tam URL: https://jsonplaceholder.typicode.com/posts?userId={userId}
    /// queryParameters: URL'nin soru işareti (?)'nden sonraki kısım
    final _query = {'userId': '$userId'};

    ///
    final _urlPosts = Uri.https(_authority, _pathPosts, _query);

    final _response = await http.get(_urlPosts, headers: _requestHeaders);

    /// 1) JSON Array[] To String:
    final _respondeBody = _response.body;

    /// 2) String To List<dynamic>:
    final List _decodedBody = jsonDecode(_respondeBody);

    /// 3-A) List<dynamic> To Iterable<Post>:
    final _iterable = _decodedBody.map((e) => Post.fromJson(e));

    /// 3-B) Iterable<Post> To List<Post>:
    final _listPosts = List<Post>.from(_iterable);

    //_listPosts.sort((a, b) => a.id!.compareTo(b.id!));

    /// Dönen Yanıt (Response) kodu 2XX: Başarılı Cevap Kodlarından olan
    /// 200 OK (Tamam) ise yani yanıt başarılı bir şekilde geri döndüyse
    if (_response.statusCode == 200) {
      /// _listPosts'u döndür.
      return _listPosts;
    } else {
      /// Status Code 200'den farklı ise
      /// bir Exception hatası fırlat.
      throw Exception(
        'Veriler alınamadı. Hata Kodu: ${_response.statusCode}',
      );
    }
  }
}
