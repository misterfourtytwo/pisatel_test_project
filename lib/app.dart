import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes/routes.dart';
import 'states/post_cubit/post_cubit.dart';
import 'models/post.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsCubit>(
      create: (BuildContext context) => PostsCubit(),
      child:
          // StreamBuilder<BoxEvent>(
          //     stream: Hive.box('data_repository').watch(key: 'theme'),
          //     builder: (context, snapshot) {
          //       final ThemeMode theme = ThemeMode.values[Hive.box('data_repository')
          //           .get('theme', defaultValue: ThemeMode.system)];
          // return
          MaterialApp(
        // themeMode: mode,
        title: 'pisatel test project',
        // themeMode:
        // theme,
        // ThemeMode.system,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
          // accentColor: Colors.red[900],
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.pink[200],
          primarySwatch: Colors.red,
        ),
        routes: {
          Home.routeName: (BuildContext context) => Home(),
          PostView.routeName: (BuildContext context) {
            final Post post = ModalRoute.of(context).settings.arguments as Post;
            return PostView(post: post);
          }
        },
        initialRoute: 'home',
        // );
        // }
      ),
    );
  }
}
