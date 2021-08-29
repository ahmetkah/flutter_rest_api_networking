import 'package:flutter/material.dart';

import '/models/models.dart';
import '/services/services.dart';
import '/views/views.dart';
import '/widgets/widgets.dart';

class PostsView extends StatefulWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  _PostsViewState createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  /// Servis sınıfından bir nesne oluştur.
  final _postService = PostService();

  /// [Future<Post>] tipinde değişken oluştur ve
  /// buna değerin sonra atanacağını belirtmek için [late] önekini kullan
  late Future<List<Post>> _future;

  @override

  /// [initState()] metodu:
  /// StatefulWidget'ın build() metodundan önce sadece bir kez çalışır
  /// Sayfa ekrana çizilmeden gösterilecek olan verilerin
  /// önceden hazırlanmasında kullanılır
  void initState() {
    super.initState();

    /// Önce late olarak belirtilen _future değişkenine [getPosts()]'u ata
    /// ve sayfa yüklenmeden [getPosts()] metodunu çağırarak hazır et.
    _future = _postService.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        appTitle: 'Tüm Posts Verilerini Listeleme ',
      ),

      /// REST API'den verileri almak ve ekranda görüntülemek için
      /// asenkron çalışan [FutureBuilder] widgetini kullanın.
      /// önce FutureBuilder'ın tipini List<Post> olarak belirtelim.
      body: FutureBuilder<List<Post>>(
        /// FutureBuilder iki parametre alır.
        /// [future] parametresi:
        /// FutureBuilder'ın tipi ile aynı olan çağırdığımız asenkron metodu içerir.
        future: _future,

        /// [builder] parametresi: Yükleme, Başarı yada Hata durumuna göre
        /// [BuildContext]: Bir widgetin Widget Ağacında (Widget Tree) nerede olduğunu belirtir.
        /// [AsyncSnapshot]: Asenkron metot sayesinde gelen verileri tutan değişken
        /// Bunun tipinide List<Post> olarak belirtelim.
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          /// API'den gelen veri başarılı ise yani snapshot veriye sahipse
          /// ekranda [SuccessPosts] widgetini göster
          if (snapshot.hasData) {
            /// API'den verileri id parametresine göre iki şekilde sıralayabilirsiniz:
            /// 1) Ascending (Azalan - Küçükten Büyüğe - A'dan Z'ye) Sıralama
            /// Bu varsayılan olarak gelmektedir.
            /// final _sortAsc = snapshot.data?..sort((a, b) => b.id!.compareTo(a.id!));

            /// 2) Descending (Azalan - Büyükten Küçüğe - Z'den A'ya) Sıralama:
            /// snapshot.data'tan gelen veriyi DES sıralayıp
            /// SuccessPosts()'a parametre olarak verdik.
            final _sortDes = snapshot.data
              ?..sort((a, b) => b.id!.compareTo(a.id!));
            return SuccessPosts(
              posts: _sortDes,
            );

            /// API'den gelen veri hatalı ise yani snapshot veriye sahip değilse
            /// ekranda hata mesajını içeren [APIErrorWidget] widgetini göster.
          } else if (snapshot.hasError) {
            return ApiErrorWidget(
              errorMessage: 'Veriler alınamadı. Hata mesajı: ${snapshot.error}',
            );

            /// Veri tamamen gelene kadar [LoadingWidget] widgetini göster.
          } else {
            return const LoadingWidget(
              text: 'Veriler yükleniyor...',
            );
          }
        },
      ),
    );
  }
}
