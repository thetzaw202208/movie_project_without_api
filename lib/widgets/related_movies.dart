import 'package:flutter/material.dart';
import 'package:movie_project/constants/colors.dart';
import 'package:movie_project/constants/dimens.dart';
import 'package:movie_project/data/movies/action_movie_list.dart';
import 'package:movie_project/widgets/rating_widget.dart';
import 'package:movie_project/widgets/reusable_text_widget.dart';

import '../data/movies/adventure_movie_list.dart';
import '../data/movies/animation_movie_list.dart';
import '../data/movies/comedy_movie_list.dart';
import '../data/movies/crime_movie_list.dart';
import '../data/movies/default_movie_list.dart';
import '../data/movies/documentary_movie_list.dart';
import '../data/movies/drama_movie_list.dart';
import '../data/movies/family_movie_list.dart';
import '../data/movies/fantasy_movie_list.dart';
import '../data/movies/war_movie_list.dart';
import '../screens/movie_detail_screen.dart';
import 'image_widget.dart';

class RelatedMovies extends StatefulWidget {
  const RelatedMovies({Key? key, this.id = 1, this.title = ""}) : super(key: key);
  final int id;
  final String title;

  @override
  State<RelatedMovies> createState() => _RelatedMoviesState();
}

class _RelatedMoviesState extends State<RelatedMovies> {
  late List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    //print("id is ${widget.id}");

    switch (widget.id) {
      case 1:
        movies = aMovieList;
        break;

      case 2:
        movies = advMovieList;
        break;

      case 3:
        movies = aniMovieList;
        break;

      case 4:
        movies = comedyMovieList;
        break;
      case 5:
        movies = crimeMovieList;
        break;

      case 6:
        movies = docMovieList;
        break;
      case 7:
        movies = dramaMovieList;
        break;
      case 8:
        movies = familyMovieList;
        break;
      case 9:
        movies = fantasyMovieList;
        break;
      case 10:
        movies = warMovieList;
        break;
      default:
        movies = movieList;
        //print(' invalid entry');
    }
  }

  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding:
                  const EdgeInsets.only(left: kPadding10x, top: kPadding10x),
              child: ReusableTextWidget(
                text: widget.title ?? "",
                color: primaryTextColor,
                fontSize: textSize14,
              )),
          sizeBxH5x,
          SizedBox(
              height: height * .3,

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.isNotEmpty ? movies.length : 0,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:const EdgeInsets.only(left: kPadding10x),
                      padding: const EdgeInsets.only(
                          top: kPadding10x,
                          bottom: kPadding10x,
                          right: kPadding15x),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailScreen(
                                id: movies[index].id,
                                movieName: movies[index].name,
                                overView: movies[index].overview,
                                rating: movies[index].rating,
                                ratingCount: movies[index].ratingCount,
                                imgUrl: movies[index].imgUrl,
                                duration: movies[index].duration,
                                date: movies[index].releaseDate,
                                genreList: movies[index].genre,
                                voteCount: movies[index].voteCount,
                                production: movies[index].production,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Hero(
                              tag: movies[index],
                              child: SizedBox(
                                width: kBoxWidth100X,
                                height: kBoxHeight170X,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: ImageWidget(
                                    imgUrl: movies[index].imgUrl,
                                  ),
                                ),
                              ),
                            ),
                            sizeBxH10x,
                            SizedBox(
                              width: kBoxWidth100X,
                              child: ReusableTextWidget(
                                text: movies[index].name,
                                maxLine: 2,
                                lineHeight: 1.4,
                                color: secondaryTextColor,
                                fontSize: textSize11,
                              ),
                            ),
                            sizeBxH5x,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ReusableTextWidget(
                                  text: movies[index].rating.toString(),
                                  color: secondaryTextColor,
                                  fontWeight: fBold,
                                  fontSize: textSize10,
                                ),
                                sizeBxW5x,
                                buildRatingBar(movies[index].ratingCount)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ]);
  }
}
