/// [1. Adım]: Model Sınıfının Oluşturulması
/// JSONPlaceHolder'un aşağıdaki endpoint'i kullanın.
/// Posts: https://jsonplaceholder.typicode.com/posts
/// Yukarıdaki bağlantı adresini kopyalayarak bağlantıya gidin.
/// Açılan sayfanın içindeki tüm JSON verilerini kopyalayın.
/// Bu ham verileri Dart nesnelerine dönüştürmek için Quicktype
/// (https://app.quicktype.io) isimli online aracı kullanın.
/// Quicktype'ın sitesine gidin, kopyalanan verileri yapıştırın,
/// Modele Post ismini verin, "Make all properties final" seçeneğini aktifleştirin
/// ve dönüştürülecek dilin Dart olduğunu belirtin.
/// Dönüştürülen kodların tamamını Copy Code düğmesiyle kopyalayın.
/// lib>models klasörü altında model ile aynı isimde olacak şekilde
/// post.dart isimli bir dart dosyası oluşturun.
/// Not 1: Quicktype'ın otomatik oluşturduğu postFromJson() ve photoToJson()
/// isimli metotları silin. Ayrıca import ile başlayan satırıda silin.
/// Not 2: Burada [1] ve [2] ile belirtilen düzeltmeleri elle yapın.
class Post {
  /// [1] Constructor (Kurucu)'ı [const] yapın.
  const Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  /// [2] REST API'dan beklenen alanların null gelebileceğini
  /// belirtmek için başlarına soru işareti [?] ekleyin.
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
