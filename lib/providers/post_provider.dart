import 'package:flutter/foundation.dart';

import '/models/models.dart';
import '/services/services.dart';

enum ApiStatus { loading, completed }

class PostProvider extends ChangeNotifier {
  /// Kurucu (Constructor)
  PostProvider() {
    /// Bu sınıf çağrıldığında getPosts() metodunu çalıştır.
    getPosts();

    /// İkinci Alternatif: Kurucu (Constructor) içinde istenen metodun
    /// çağrılmasını istemiyorsanızmain.dart'ta bulunan ve kök widgetimiz App'ı
    /// saran ChangeNotifierProvider<PostProvider>'ın create parametresinde
    /// aşağıdaki gibi çağırabilirsiniz.
    /// create: (context) => PostProvider()..posts,
  }
  final _postService = PostService();

  ///
  ApiStatus _apiStatus = ApiStatus.loading;

  /// Getter
  ApiStatus get apiStatus => _apiStatus;

  /// Setter
  void setApiStatus(ApiStatus newApiStatus) {
    _apiStatus = newApiStatus;
    notifyListeners();
  }

  List<Post>? _posts;

  /// Getter
  List<Post>? get posts => _posts;

  ///
  Future<void> getPosts() async {
    setApiStatus(ApiStatus.loading);

    _posts = await _postService.getPosts();

    setApiStatus(ApiStatus.completed);

    notifyListeners();
  }
}
