import 'package:flutter/material.dart';

import '/models/models.dart';

class SuccessPost extends StatelessWidget {
  const SuccessPost({
    Key? key,
    this.post,
  }) : super(key: key);

  final Post? post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(
          'Id: ${post?.id}',
        ),
        title: Text(
          'Title: ${post?.title}',
        ),
        subtitle: Text(
          'Body: ${post?.body}',
        ),
        trailing: Text(
          'userId: ${post?.userId}',
        ),
      ),
      elevation: 4.0,
    );
  }
}
