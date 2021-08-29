import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarWidget(
          appTitle: "/posts İçin Metotlar",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: ListView(
          children: [
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              title: const Text(
                'İstek Metodu (Request Metot): GET',
              ),
              isThreeLine: true,
              subtitle: const Text(
                'Path: /posts \nYanıt (Response): JSON Array[]',
              ),
              onTap: () => Navigator.pushNamed(
                context,
                'posts',
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              title: const Text(
                'İstek Metodu (Request Metot): GET',
              ),
              isThreeLine: true,
              subtitle: const Text(
                'Path: /posts/5 \nYanıt (Response): JSON Object{}',
              ),
              onTap: () => Navigator.pushNamed(
                context,
                'postId',
                arguments: 5,
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              title: const Text(
                'İstek Metodu (Request Metot): GET',
              ),
              isThreeLine: true,
              subtitle: const Text(
                'Path: /posts \nQuery: userId=10 \nYanıt (Response): JSON Array[]',
              ),
              onTap: () => Navigator.pushNamed(
                context,
                'postsUserId',
                arguments: 10,
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
