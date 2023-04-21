import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_project/constants/colors.dart';
import 'package:movie_project/utils/strings_extension.dart';
import 'package:movie_project/widgets/related_movies.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/dimens.dart';
import '../constants/strings.dart';
import '../data/actors/actor_list.dart';
import '../data/creators/creator_list.dart';
import '../data/movie_types/movie_type.dart';
import '../data/movies/action_movie_list.dart';
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
import '../widgets/blur_effect.dart';
import '../widgets/image_widget.dart';
import '../widgets/reusable_text_widget.dart';

class TopSlideShow extends StatefulWidget {
  const TopSlideShow({Key? key}) : super(key: key);

  @override
  State<TopSlideShow> createState() => _TopSlideShowState();
}

class _TopSlideShowState extends State<TopSlideShow> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  late List<dynamic> movies = [];
  @override
  void initState() {
    super.initState();

    int movieID = Random().nextInt(9) + 1;
    switch (movieID) {
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height * .24,
          child: PageView.builder(
            controller: controller,
            //physics:const NeverScrollableScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return GestureDetector(
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
                child: Stack(
                  children: [
                    SizedBox(
                      width: width,
                      child: ImageWidget(
                        imgUrl: movies[index].imgUrl,
                      ),
                    ),
                    sizeBxH10x,
                    const BottomBlurEffect(),
                    Positioned(
                      bottom: 0.0,
                      top: height * .10,
                      left: width * .45,
                      right: 0.0,
                      child: const FaIcon(
                        FontAwesomeIcons.circlePlay,
                        color: secondaryColor,
                        size: kIconSize40X,
                      ),
                    ),

                    ///Movie Title
                    Positioned(
                        top: height * .19,
                        left: width * .02,
                        child: ReusableTextWidget(
                          text: movies[index].name,
                          color: secondaryTextColor,
                          fontSize: textSize18,
                          fontWeight: fBold,
                        ))
                  ],
                ),
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: movies.length,
          effect: const WormEffect(
              dotColor: primaryTextColor,
              activeDotColor: secondaryColor,
              dotHeight: 9,
              dotWidth: 9,
              spacing: 10,
              paintStyle: PaintingStyle.fill),
        ),
      ],
    );
  }
}

class CheckMovieShowTimesBox extends StatelessWidget {
  const CheckMovieShowTimesBox({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .23,
      child: Card(
        margin: const EdgeInsets.all(kPadding15x),
        color: relatedMovieBgColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: kBoxWidth200X,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: kPadding20x, top: kPadding20x),
                    child: ReusableTextWidget(
                      text: kCheckMTimes,
                      maxLine: 2,
                      color: secondaryTextColor,
                      fontSize: textSize22,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: kPadding20x, bottom: kPadding20x),
                  child: ReusableTextWidget(
                    text: kSeeMore.toUpperCase(),
                    color: secondaryColor,
                    fontSize: textSize14,
                    style: TextDecoration.underline,
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(kPadding20x),
              child: Icon(
                Icons.location_on_rounded,
                color: iconColor,
                size: kIconSize40X,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieTypeItemView extends StatefulWidget {
  const MovieTypeItemView({Key? key}) : super(key: key);

  @override
  State<MovieTypeItemView> createState() => _MovieTypeItemViewState();
}

class _MovieTypeItemViewState extends State<MovieTypeItemView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  //bool isLoading=false;
  late String toPrint = "default";
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: movieTypeList.length);
    _tabController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
        height: height * .4,
        child: DefaultTabController(
          length: movieTypeList.length,
          child: Scaffold(
            backgroundColor: primaryColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(height * .06),
              child: AppBar(
                backgroundColor: primaryColor,
                bottom: TabBar(
                  controller: _tabController,
                  indicatorColor: secondaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3.0,
                  unselectedLabelColor: primaryTextColor,
                  labelColor: secondaryColor,
                  isScrollable: true,
                  tabs: movieTypeList.map((genre) {
                    return Container(
                        padding: const EdgeInsets.only(
                            bottom: kPadding10x, top: kPadding10x),
                        child: ReusableTextWidget(
                          text: genre.name,
                          fontSize: textSize14,
                          fontWeight: fBold,
                        ));
                  }).toList(),
                ),
              ),
            ),
            body: TabBarView(
              clipBehavior: Clip.none,
              controller: _tabController,
              viewportFraction: 1,
              physics: const ClampingScrollPhysics(),
              children: movieTypeList.map((MovieType genre) {
                return Container(
                  color: relatedMovieBgColor,
                  child: RelatedMovies(
                    id: genre.id,
                    title: genre.name,
                  ),
                );
              }).toList(),
            ),
          ),
        ));
  }
}

class EasyTitleAndScrollImage extends StatefulWidget {
  const EasyTitleAndScrollImage(
      {Key? key,
      required this.type,
      required this.title1,
      this.title2,
      required this.imgWidth,
      required this.imgHeight,
      this.color})
      : super(key: key);
  final String type;
  final String title1;
  final String? title2;
  final double imgWidth;
  final double imgHeight;
  final Color? color;

  @override
  State<EasyTitleAndScrollImage> createState() =>
      _EasyTitleAndScrollImageState();
}

class _EasyTitleAndScrollImageState extends State<EasyTitleAndScrollImage> {
  late List<dynamic> movies = [];
  late List<dynamic> actor = [];
  late List<dynamic> creator = [];

  @override
  void initState() {
    super.initState();
    if (widget.type == 'showcase') {
      int movieID = Random().nextInt(9) + 1;
      switch (movieID) {
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
    } else if (widget.type == 'actor') {
      actor = actorList;
      print("Actor List");
      print(actor);
    } else {
      creator = creatorList;
    }
  }

  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      Padding(
          padding: const EdgeInsets.only(
              left: kPadding10x, top: kPadding10x, right: kPadding10x),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableTextWidget(
                text: widget.title1,
                color: widget.color ?? primaryTextColor,
                fontSize: textSize14,
              ),
              ReusableTextWidget(
                text: widget.title2 ?? "",
                style: TextDecoration.underline,
                color: secondaryTextColor,
                fontSize: textSize14,
              ),
            ],
          )),
      sizeBxH5x,
      SizedBox(
          height: height * .289,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.type == 'actor'
                  ? actor.length
                  : widget.type == 'showcase'
                      ? movies.length
                      : creator.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: kPadding10x),
                  padding: const EdgeInsets.only(
                      top: kPadding10x,
                      bottom: kPadding10x,
                      right: kPadding15x),
                  child: Stack(
                    children: <Widget>[
                      Hero(
                        tag: widget.type == 'actor'
                            ? actor[index]
                            : widget.type == 'showcase'
                                ? movies[index]
                                : creator[index],
                        child: SizedBox(
                          width: widget.imgWidth,
                          height: widget.imgHeight,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: ImageWidget(
                              imgUrl: widget.type == 'actor'
                                  ? actor[index].imgUrl
                                  : widget.type == 'showcase'
                                      ? movies[index].imgUrl
                                      : creator[index].imgUrl,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        top: widget.type == 'actor' || widget.type == 'creator'
                            ? kPadding10x
                            : kPadding80x,
                        left: widget.type == 'actor' || widget.type == 'creator'
                            ? kPadding110x
                            : kPadding150x,
                        right: 0.0,
                        child: FaIcon(
                          widget.type == 'actor' || widget.type == 'creator'
                              ? FontAwesomeIcons.heart
                              : FontAwesomeIcons.circlePlay,
                          color:
                              widget.type == 'actor' || widget.type == 'creator'
                                  ? iconColor
                                  : secondaryColor,
                          size:
                              widget.type == 'actor' || widget.type == 'creator'
                                  ? kIconSize30X
                                  : kIconSize40X,
                        ),
                      ),
                      Positioned(
                        top: kPadding140x,
                        left: kPadding10x,
                        width: kImgWidth300X,
                        child: ReusableTextWidget(
                          text: widget.type == 'actor'
                              ? actor[index].name
                              : widget.type == 'showcase'
                                  ? movies[index].name
                                  : creator[index].name,
                          maxLine: 2,
                          color: secondaryTextColor,
                          lineHeight: 1.4,
                          fontSize: textSize16,
                          fontWeight: fBold,
                        ),
                      ),
                      Positioned(
                        top: kPadding170x,
                        left: kPadding10x,
                        width: kImgWidth300X,
                        child: Row(
                          children: [
                            widget.type == 'actor' || widget.type == 'creator'
                                ? const Icon(
                                    Icons.thumb_up_alt,
                                    color: secondaryColor,
                                    size: kIconSize15X,
                                  )
                                : const SizedBox(),
                            ReusableTextWidget(
                              text: widget.type == 'actor'
                                  ? ''.getMovie(actor[index].likes)
                                  : widget.type == 'creator'
                                      ? ''.getMovie(creator[index].likes)
                                      : movies[index].releaseDate,
                              maxLine: 2,
                              color: primaryTextColor,
                              lineHeight: 1.4,
                              fontSize: textSize12,
                              fontWeight: fBold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }))
    ]);
  }
}

class AboutFilm extends StatelessWidget {
  const AboutFilm({
    Key? key,
    required this.width,
    required this.movieName,
    required this.genre,
    required this.production,
    required this.premiere,
    required this.overview,
  }) : super(key: key);

  final double width;
  final String movieName;
  final String genre;
  final String production;
  final String premiere;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: kBoxHeight400X,
      padding: const EdgeInsets.only(left: kPadding10x),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ReusableTextWidget(
                text: kAbout.toUpperCase(),
                color: secondaryTextColor,
              ),
              sizeBxH15x,
              const ReusableTextWidget(
                text: kOrgTitle,
                color: secondaryTextColor,
              ),
              sizeBxH15x,
              const ReusableTextWidget(
                text: kType,
                color: secondaryTextColor,
              ),
              sizeBxH15x,
              const ReusableTextWidget(
                text: kProduction,
                color: secondaryTextColor,
              ),
              sizeBxH15x,
              const ReusableTextWidget(
                text: kPremiere,
                color: secondaryTextColor,
              ),
              sizeBxH15x,
              const ReusableTextWidget(
                text: kDescription,
                color: secondaryTextColor,
              ),
              sizeBxH15x,
            ],
          ),
          sizeBxW15x,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ReusableTextWidget(text: ""),
              sizeBxH15x,
              ReusableTextWidget(
                text: movieName,
                color: secondaryTextColor,
              ),
              sizeBxH15x,
              ReusableTextWidget(
                text: genre,
                color: secondaryTextColor,
              ),
              sizeBxH15x,
              ReusableTextWidget(
                text: production,
                color: secondaryTextColor,
              ),
              sizeBxH15x,
              ReusableTextWidget(
                text: premiere,
                color: secondaryTextColor,
              ),
              sizeBxH15x,
              SizedBox(
                width: kBoxWidth280X,
                child: ReusableTextWidget(
                  text: overview,
                  color: secondaryTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StoryLinesBody extends StatelessWidget {
  const StoryLinesBody({
    Key? key,
    required this.overview,
  }) : super(key: key);

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding10x),
      child: ReusableTextWidget(
        text: overview,
        color: secondaryTextColor,
        fontSize: textSize14,
        lineHeight: 1.5,
      ),
    );
  }
}

class Creators extends StatelessWidget {
  const Creators({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: relatedMovieBgColor,
      child: const EasyTitleAndScrollImage(
        imgWidth: kImgWidth150X,
        imgHeight: kImgHeight200X,
        title1: kCreator,
        title2: kMoreCreator,
        color: primaryColor,
        type: 'creator',
      ),
    );
  }
}

class Actors extends StatelessWidget {
  const Actors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: relatedMovieBgColor,
      child: const EasyTitleAndScrollImage(
        imgWidth: kImgWidth150X,
        imgHeight: kImgHeight200X,
        title1: kActor,
        color: primaryColor,
        type: 'actor',
      ),
    );
  }
}

class PlayAndRate extends StatelessWidget {
  const PlayAndRate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding10x),
      child: Row(
        children: [
          Chip(
            avatar: const Icon(
              Icons.play_circle_outline_outlined,
              //color: secondaryColor,
              size: kIconSize20X,
            ),
            backgroundColor: secondaryColor,
            label: ReusableTextWidget(
              text: kPlayTrailerText.toUpperCase(),
              color: secondaryTextColor,
              fontSize: textSize12,
            ),
          ),
          sizeBxW5x,
          Chip(
            side: const BorderSide(color: whiteColor),
            avatar: const Icon(
              Icons.star,
              color: secondaryColor,
              size: kIconSize20X,
            ),
            backgroundColor: primaryColor,
            label: ReusableTextWidget(
              text: kRateMovieText.toUpperCase(),
              color: secondaryTextColor,
              fontSize: textSize12,
            ),
          ),
        ],
      ),
    );
  }
}

class DurationAndGenreList extends StatelessWidget {
  const DurationAndGenreList({
    Key? key,
    required this.duration,
    required this.genreList,
  }) : super(key: key);
  final String duration;
  final List genreList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding10x),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.watch_later_outlined,
                color: secondaryColor,
                size: kIconSize20X,
              ),
              sizeBxW5x,
              ReusableTextWidget(
                text: duration,
                color: secondaryTextColor,
                fontSize: textSize12,
              ),
            ],
          ),
          sizeBxW10x,
          SizedBox(
            width: kBoxWidth270X,
            height: kBoxHeight40X,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: genreList.length,
                itemBuilder: (context, index) {
                  return Chip(
                    side: const BorderSide(color: whiteColor),
                    backgroundColor: primaryColor,
                    label: ReusableTextWidget(
                      text: genreList[index],
                      color: secondaryTextColor,
                      fontSize: textSize12,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
