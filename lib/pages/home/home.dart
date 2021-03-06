import 'package:douban/pages/home/widgets.dart';
import 'package:flutter/material.dart';

import '../../models/home_models.dart';
import '../../network/home_request.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  HomeRequest homeRequest = HomeRequest();
  int _start = 0;
  List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();
    homeRequest.getMovieTopList(_start).then((result) {
      setState(() {
        movies.addAll(result);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (ctx, index) {
        return HomeMovieItem(
          movieItem: movies[index],
        );
      },
    );
  }
}
