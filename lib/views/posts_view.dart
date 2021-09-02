import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/providers.dart';
import '/widgets/widgets.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        appTitle: 'Tüm Posts Verilerini Listeleme ',
      ),

      /// ChangeNotifier sınıfında private olarak tanımladığımız ve değişimini
      /// dinleyeceğimiz değişkenlere erişmek için;
      /// Provider kütüphanesinin bize sağladığı [Consumer<T>] widgeti ile
      /// [Provider.of<T>(context) ya da context.watch<T>()];
      /// yardımcı metotlarından birini kullanabiliriz.
      body: Consumer<PostProvider>(
        builder: (context, model, child) {
          /// Veri tamamen gelene kadar [LoadingWidget] widgetini göster.
          if (model.apiStatus == ApiStatus.loading) {
            return const LoadingWidget(
              text: 'Veriler yükleniyor...',
            );
          } else if (model.apiStatus == ApiStatus.completed) {
            return SuccessWidget(
              posts: model.posts,
            );
          } else {
            return const ApiErrorWidget(
              errorMessage: 'Veriler alınamadı',
            );
          }
        },
      ),
    );
  }
}
