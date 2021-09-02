import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'app.dart';
import 'providers/providers.dart';

/// [main()] metodu:
/// Uygulama çalıştırılacağı zaman Flutter ilk olarak bu metodu bulur
/// ve uygulama buradan çalışır.
/// Uygulama da tek bir tane main() metodu vardır.
/// [void] ön eki:
/// main() metodunun herhangi bir değer döndürmediğini ifade eder.
void main() {
  /// [runApp()] metodu:
  /// Uygulamanın kök widgetini çalıştırırarak ekrana görüntü gelmesini sağlar.
  runApp(
    /// []: ChangeNotifierProvider’ı Konumlandırdık
    ChangeNotifierProvider<PostProvider>(
      create: (context) => PostProvider()..posts,

      ///
      ///create: (context) => PostProvider()..posts,

      /// [App] widgeti:
      /// Widget ağacımızın kökü olan ve bir [MaterialApp] döndürecek olan widgettir.
      /// Okunurluk açısından bu [App] widgetini app.dart isimli
      /// ayrı bir dart dosyasında oluşturduk.
      child: const App(),
    ),
  );
}
