import 'package:flutter/material.dart';
import 'package:movie_project/constants/colors.dart';
import 'package:movie_project/constants/dimens.dart';
import 'package:movie_project/constants/strings.dart';

import '../view_items/home_view_items.dart';
import '../widgets/related_movies.dart';
import '../widgets/reusable_text_widget.dart';

class MovieHomeScreen extends StatefulWidget {
  const MovieHomeScreen({Key? key}) : super(key: key);

  @override
  State<MovieHomeScreen> createState() => _MovieHomeScreenState();
}

class _MovieHomeScreenState extends State<MovieHomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
        //useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_sharp,
              color: iconColor,
            ),
          ),
          title: const ReusableTextWidget(
            text: kAppBarTitle,
            color: secondaryTextColor,
            fontSize: textSize22,
            fontWeight: fNormal,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_sharp,
                  color: iconColor,
                ))
          ],
        ),
        body: ListView(
          children: <Widget>[
            const TopSlideShow(),
            sizeBxH20x,
            const RelatedMovies(
              title: kPopularMovie,
            ),
            CheckMovieShowTimesBox(height: height),
            const MovieTypeItemView(),
            const EasyTitleAndScrollImage(
              imgWidth: kImgWidth350X,
              imgHeight: kImgHeight200X,
              title1: kShowCase,
              title2: kMoreShowCase,
              type: 'showcase',
            ),
            sizeBxH20x,
            Container(
              color: relatedMovieBgColor,
              child: const EasyTitleAndScrollImage(
                imgWidth: kImgWidth150X,
                imgHeight: kImgHeight200X,
                color: primaryColor,
                title1: kBestActor,
                title2: kMoreActor,
                type: 'actor',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
