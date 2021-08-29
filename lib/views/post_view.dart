import 'package:flutter/material.dart';

import '/models/models.dart';
import '/services/services.dart';
import '/views/views.dart';
import '/widgets/widgets.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final _postService = PostService();
  late Future<Post> _future;

  @override
  void initState() {
    super.initState();
    _future = _postService.getPostWithId(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        appTitle: "Id değeri ${widget.id} olan Post",
      ),
      body: FutureBuilder<Post>(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<Post> snapshot) {
          if (snapshot.hasData) {
            return SuccessPost(
              post: snapshot.data,
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
