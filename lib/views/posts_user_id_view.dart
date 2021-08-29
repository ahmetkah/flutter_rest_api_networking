import 'package:flutter/material.dart';

import '/models/models.dart';
import '/services/services.dart';
import '/views/views.dart';
import '/widgets/widgets.dart';

class PostsUserIdView extends StatefulWidget {
  const PostsUserIdView({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  _PostsUserIdViewState createState() => _PostsUserIdViewState();
}

class _PostsUserIdViewState extends State<PostsUserIdView> {
  final _postService = PostService();
  late Future<List<Post>> _future;

  @override
  void initState() {
    super.initState();
    _future = _postService.getPostsWithQueryUserId(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        appTitle: 'UserId değeri ${widget.userId} olan Post',
      ),
      body: FutureBuilder<List<Post>>(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            return SuccessPosts(
              posts: snapshot.data,
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
