import 'package:flutter/material.dart';
import 'package:movie_project/constants/dimens.dart';
import 'package:movie_project/constants/strings.dart';
import 'package:movie_project/screens/home_screen.dart';
import 'package:movie_project/utils/assets_image.dart';
import 'package:movie_project/utils/strings_extension.dart';
import 'package:movie_project/widgets/related_movies.dart';
import 'package:movie_project/widgets/reusable_text_widget.dart';
import '../constants/colors.dart';
import '../view_items/home_view_items.dart';
import '../widgets/blur_effect.dart';
import '../widgets/image_widget.dart';
import '../widgets/rating_widget.dart';
import '../widgets/reusable_container.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen(
      {super.key,
      required this.id,
      required this.imgUrl,
      required this.movieName,
      required this.overView,
      required this.rating,
      required this.ratingCount,
      required this.duration,
      required this.date,
      required this.genreList,
      required this.voteCount,
      required this.production});
  final int id;
  final String imgUrl;
  final String movieName;
  final String overView;
  final double rating;
  final double ratingCount;
  final String production;
  final String duration;
  final String date;
  final List<String> genreList;
  final int voteCount;

  @override
  // ignore: library_private_types_in_public_api
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late String genre;
  @override
  void initState() {
    super.initState();
    var assignGenre = widget.genreList.toString();
    var firstSplit = assignGenre.split('[')[1];
    genre = firstSplit.split(']')[0];
    print("Genre list split");
    print(genre);
    // print("Genre list is");
    // print(widget.genreList[1]);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: primaryColor,
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context,
                    bool innerBoxIsScrolled) =>
                [
                  SliverAppBar(
                    //title: ReusableTextWidget(text:widget.movieName),
                    //pinned: true,
                    floating: true,
                    backgroundColor: primaryColor,
                    expandedHeight: kMovieDetailBox,
                    actions: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search_sharp,
                            size: kIconSize30X,
                          ))
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      // title: ReusableTextWidget(text:widget.movieName),
                      background: Stack(
                        children: [
                          SizedBox(
                            width: width,
                            child: ImageWidget(
                              imgUrl: widget.imgUrl,
                            ),
                          ),
                          const BottomBlurEffect(),
                          Positioned(
                              width: width,
                              top: kPadding210x,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: kPadding15x),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ReusableContainer(
                                      child: Center(
                                        child: ReusableTextWidget(
                                          text: widget.date.substring(0, 4),
                                          color: secondaryTextColor,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            buildRatingBar(widget.ratingCount),
                                            ReusableTextWidget(
                                              text:
                                                  "".getVote(widget.voteCount),
                                              color: secondaryTextColor,
                                            ),
                                          ],
                                        ),
                                        sizeBxW15x,
                                        ReusableTextWidget(
                                          text: widget.rating.toString(),
                                          color: secondaryTextColor,
                                          fontSize: textSize40,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          Positioned(
                              top: kPadding260x,
                              left: kPadding20x,
                              child: ReusableTextWidget(
                                text: widget.movieName,
                                fontSize: textSize22,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MovieHomeScreen(),
                          ),
                        );
                      },
                      icon: ImageWidget(
                        imgUrl: AssetsImages.leftArrow,
                        width: leftArrowIconWidth,
                        height: leftArrowIconHeight,
                      ),
                    ),
                  ),
                ],
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DurationAndGenreList(
                      duration: widget.duration, genreList: widget.genreList),
                  const Padding(
                    padding:
                        EdgeInsets.only(left: kPadding10x, top: kPadding20x),
                    child: ReusableTextWidget(
                      text: kOverView,
                      color: primaryTextColor,
                      fontSize: textSize14,
                    ),
                  ),
                  sizeBxW5x,
                  StoryLinesBody(overview: widget.overView),
                  sizeBxH10x,
                  const PlayAndRate(),
                  sizeBxH10x,
                  const Actors(),
                  sizeBxH10x,
                  AboutFilm(
                      width: width,
                      movieName: widget.movieName,
                      genre: genre,
                      production: widget.production,
                      premiere: widget.date,
                      overview: widget.overView),
                  const Creators(),
                  sizeBxH10x,
                  Container(
                    color: primaryColor,
                    child: RelatedMovies(
                      title: kRelatedMovie,
                      id: widget.id,
                    ),
                  ),
                  sizeBxH10x
                ],
              ),
            )));
  }
}

