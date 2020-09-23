import 'package:flutter/material.dart';
import 'package:pisatel_test_project/models/comment.dart';

class CommentsListWidget extends StatelessWidget {
  final List<Comment> comments;
  const CommentsListWidget({
    this.comments,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              comments[index].name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              comments[index].body,
              softWrap: true,
            ),
          ),
          SizedBox(height: 4),
          Divider(height: 2),
          SizedBox(height: 8),
        ],
      ),
      childCount: comments.length,
    ));
  }
}
