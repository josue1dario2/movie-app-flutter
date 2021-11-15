
import 'package:flutter/material.dart';
import 'package:movie_app/providers/movies_provider.dart';
import 'package:movie_app/search/search_delegate.dart';
import 'package:movie_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: ()=> showSearch(
                  context: context,
                  delegate: MovieSearchDelegate()
              ),
              icon: Icon(Icons.search_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies : moviesProvider.onDisplayMovies),
            MovieSlider(
              movies : moviesProvider.popularMovies,
              title : 'Populares',
              onNextPage: ()=> moviesProvider.getPopularMovies(),
            ),

          ],
        ),
      )
    );
  }
}
