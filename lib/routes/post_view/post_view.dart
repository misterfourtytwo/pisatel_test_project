import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisatel_test_project/models/post.dart';
import 'package:pisatel_test_project/routes/post_view/comments_list_widget.dart';
import 'package:pisatel_test_project/routes/views/error.dart';
import 'package:pisatel_test_project/routes/views/loading.dart';
import 'package:pisatel_test_project/services/api_client.dart';
import 'package:pisatel_test_project/states/comment/comment_cubit.dart';
import 'package:pisatel_test_project/widgets/avatar_widget.dart';
import 'package:pisatel_test_project/widgets/reload_button.dart';

class PostView extends StatefulWidget {
  static const routeName = 'post_view';
  final Post post;
  const PostView({this.post, Key key}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  CommentsCubit commentsCubit;

  @override
  void initState() {
    super.initState();
    commentsCubit = CommentsCubit(widget.post);
    commentsCubit.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: Stack(children: [
                Positioned(
                    left: 64,
                    top: 8,
                    bottom: 8,
                    right: 8,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Hero(
                        tag: widget.post,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: AvatarWidget(
                            photoGetter: () =>
                                ApiClient.fetchPhoto(widget.post),
                            isBig: true,
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    top: 0,
                    left: 64,
                    right: 0,
                    // bottom: 8,
                    height: kToolbarHeight,
                    child: Container(
                      color: Theme.of(context).primaryColor.withOpacity(.5),
                      padding: EdgeInsets.only(left: kToolbarHeight - 12),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.post.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                    )),
              ]),

              primary: true,
              pinned: true,
              expandedHeight: 400,
              elevation: 16,
              // collapsedHeight: kToolbarHeight,
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 32,
                  ),
                  child: Text(
                    '${widget.post.body}',
                    style: Theme.of(context).primaryTextTheme.bodyText2,
                  ),
                ),
                SizedBox(height: 8),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  child: Text(
                    'Comments:',
                    style: Theme.of(context).primaryTextTheme.headline5,
                  ),
                ),
                Divider(),
              ]),
            ),
            BlocBuilder<CommentsCubit, CommentsState>(
              cubit: commentsCubit,
              builder: (BuildContext context, CommentsState state) {
                return state is CommentsLoading
                    ? SliverFillRemaining(
                        hasScrollBody: false,
                        fillOverscroll: true,
                        child: const LoadingView(),
                      )
                    : state is CommentsLoaded
                        ? CommentsListWidget(comments: state.items)
                        : SliverFillRemaining(
                            hasScrollBody: false,
                            fillOverscroll: true,
                            child: ErrorView(
                              message: (state as CommentsError)?.message ??
                                  'Unknown error',
                              reloadButton:
                                  ReloadButton(onPressed: commentsCubit.load),
                            ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
