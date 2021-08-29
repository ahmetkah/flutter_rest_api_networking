import 'package:flutter/material.dart';

import '/views/views.dart';

class Routes {
  /// Lazy Loading Singleton
  static Routes? _instance;
  static Routes? get instance {
    _instance ??= Routes._init();
    return _instance;
  }

  Routes._init();

  Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );

      case 'posts':
        return MaterialPageRoute(
          builder: (context) => const PostsView(),
        );

      case 'postId':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => PostView(id: args as int),
        );

      case 'postsUserId':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => PostsUserIdView(userId: args as int),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text(
                'Sayfa Bulunamadı',
              ),
            ),
          ),
        );
    }
  }
}
