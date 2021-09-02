import 'package:flutter/material.dart';

import '/models/models.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<Post>? posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts?.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: Text(
              'Id: ${posts?[index].id}',
            ),
            title: Text(
              'Title: ${posts?[index].title}',
            ),
            subtitle: Text(
              'Body: ${posts?[index].body}',
            ),
            trailing: Text(
              'userId: ${posts?[index].userId}',
            ),
          ),
          elevation: 4.0,
        );
      },
      padding: const EdgeInsets.all(
        10.0,
      ),
    );
  }
}
