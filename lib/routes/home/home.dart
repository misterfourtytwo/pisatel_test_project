import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisatel_test_project/routes/routes.dart';
import 'package:pisatel_test_project/routes/views/error.dart';
import 'package:pisatel_test_project/routes/views/loading.dart';
import 'package:pisatel_test_project/services/api_client.dart';
import 'package:pisatel_test_project/states/post_cubit/post_cubit.dart';
import 'package:pisatel_test_project/widgets/avatar_widget.dart';
import 'package:pisatel_test_project/widgets/reload_button.dart';

class Home extends StatefulWidget {
  static const routeName = 'home';
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PostsCubit get cubit => BlocProvider.of<PostsCubit>(context);

  @override
  void initState() {
    super.initState();
    cubit.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        actions: [
          // ThemeToggleButton(),
        ],
      ),
      body: BlocBuilder<PostsCubit, PostState>(
        builder: (
          BuildContext context,
          PostState state,
        ) =>
            state is PostLoading
                ? const LoadingView()
                : state is PostLoaded
                    ? ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ListTile(
                          onTap: () => Navigator.of(context).pushNamed(
                            PostView.routeName,
                            arguments: state.items[index],
                          ),
                          leading: Hero(
                              tag: state.items[index],
                              child: AvatarWidget(
                                photoGetter: () async =>
                                    ApiClient.fetchPhoto(state.items[index]),
                                isBig: false,
                              )),
                          title: Text(
                            state.items[index].title,
                          ),
                          trailing: Icon(Icons.info_outline),
                        ),
                      )
                    : ErrorView(
                        message:
                            (state as PostError)?.message ?? 'Unknown error',
                        reloadButton: ReloadButton(onPressed: cubit.load),
                      ),
      ),
    );
  }
}
