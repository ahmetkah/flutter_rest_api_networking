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
  final _postService = PostService();
  late Future<List<Post>> _future;

  @override
  void initState() {
    super.initState();
    _future = _postService.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        appTitle: 'Tüm Posts Verilerini Listeleme ',
      ),
      body: FutureBuilder<List<Post>>(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
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
          } else if (snapshot.hasError) {
            return ApiErrorWidget(
              errorMessage: 'Veriler alınamadı. Hata mesajı: ${snapshot.error}',
            );
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
