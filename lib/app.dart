import 'package:flutter/material.dart';

import 'routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [MaterialApp] widgeti:
    /// Uygulamayı en dıştan saran ve ana kapsayıcı widget'dır.
    /// Uygulama ana arayüzünün temeli burada atılır.
    return MaterialApp(
      /// [title] parametresi: "Uygulama Adı/Başlığı"
      title: 'Networking',

      /// [debugShowCheckedModeBanner] parametresi:
      /// Sağ üstte Debug adında bir etiket yer alır.
      /// Bu etiketi kaldırmak (false) / göstermek (true) için kullanılır.
      debugShowCheckedModeBanner: false,

      /// [theme] parametresi:
      /// Uygulamanın genel teması
      theme: ThemeData.dark(),

      /// [onGenerateRoute] parametresi:
      /// Bu parametreye routes\routes.dart sayfasında uygulama boyunca
      /// kullanacağımız adlandırılmış sayfa rotaları için
      /// oluşturduğumuz [route()] isimli metodu verdik.
      onGenerateRoute: Routes.instance!.route,
    );
  }
}
