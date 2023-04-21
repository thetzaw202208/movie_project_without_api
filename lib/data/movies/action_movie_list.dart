class ActionMovieList {
  final int id;
  final String imgUrl;
  final String name;
  final double rating;
  final double ratingCount;
  final String overview;
  final String duration;
  final String releaseDate;
  final List<String> genre;
  final int voteCount;
  final String production;

  ActionMovieList(
      this.id,
      this.imgUrl,
      this.name,
      this.rating,
      this.ratingCount,
      this.overview,
      this.duration,
      this.releaseDate,
      this.genre,
      this.voteCount,
      this.production);
}

List<ActionMovieList> aMovieList = [
  ActionMovieList(
      1,
      'assets/images/action/equalizer2.png',
      'Equalizer 2',
      8.0,
      4.5,
      ' In a world filled with hate and prejudice, they are feared by those who cannot accept their differences. Led by Xavier the X-Men fight to protect a world that fears them. They are locked in a battle with former colleague and friend, Magneto who believes humans and mutants should never co-exist.They are children of the atom, homo superior, the next link in the chain of evolution.  In a world filled with hate and prejudice, they are feared by those who cannot accept their differences. Led by Xavier the X-Men fight to protect a world that fears them. They are locked in a battle with former colleague and friend, Magneto who believes humans and mutants should never co-exist. ',
      '2hrs 56min',
      '2022-05-02',
      ['Science Fiction', 'Action', 'Drama'],
      2546,
      'United States of America'),

  ///ActionMovieList('assets/images/action/fearless.png', 'Fearless', 7.8,
  ///' In a world filled with hate and prejudice, they are feared by those who cannot accept their differences. Led by Xavier the X-Men fight to protect a world that fears them. They are locked in a battle with former colleague and friend, Magneto who believes humans and mutants should never co-exist.They are children of the atom, homo superior, the next link in the chain of evolution.  In a world filled with hate and prejudice, they are feared by those who cannot accept their differences. Led by Xavier the X-Men fight to protect a world that fears them. They are locked in a battle with former colleague and friend, Magneto who believes humans and mutants should never co-exist. ','2hrs 56min','2022-05-02',['War','Action','Drama'],200),
  ActionMovieList(
      1,
      'assets/images/action/freedom.png',
      'Freedom',
      6.5,
      4.0,
      ' In a world filled with hate and prejudice, they are feared by those who cannot accept their differences. Led by Xavier the X-Men fight to protect a world that fears them. They are locked in a battle with former colleague and friend, Magneto who believes humans and mutants should never co-exist.They are children of the atom, homo superior, the next link in the chain of evolution.  In a world filled with hate and prejudice, they are feared by those who cannot accept their differences. Led by Xavier the X-Men fight to protect a world that fears them. They are locked in a battle with former colleague and friend, Magneto who believes humans and mutants should never co-exist. ',
      '2hrs 56min',
      '2022-05-02',
      ['War', 'Action'],
      1670,
      'United States of America'),
  ActionMovieList(
      1,
      'assets/images/action/hobbs_and_shaaw.png',
      'Hobbs & Shaw',
      9,
      5.0,
      ' In a world filled with hate and prejudice, they are feared by those who cannot accept their differences. Led by Xavier the X-Men fight to protect a world that fears them. They are locked in a battle with former colleague and friend, Magneto who believes humans and mutants should never co-exist.They are children of the atom, homo superior, the next link in the chain of evolution.  In a world filled with hate and prejudice, they are feared by those who cannot accept their differences. Led by Xavier the X-Men fight to protect a world that fears them. They are locked in a battle with former colleague and friend, Magneto who believes humans and mutants should never co-exist. ',
      '2hrs 56min',
      '2022-05-02',
      ['War', 'Action'],
      549,
      'United States of America'),
  ActionMovieList(
      1,
      'assets/images/action/judgement.png',
      'Judgement',
      8.4,
      4.5,
      ' In a world filled with hate and prejudice, they are feared by those who cannot accept their differences. Led by Xavier the X-Men fight to protect a world that fears them. They are locked in a battle with former colleague and friend, Magneto who believes humans and mutants should never co-exist.They are children of the atom, homo superior, the next link in the chain of evolution.  In a world filled with hate and prejudice, they are feared by those who cannot accept their differences. Led by Xavier the X-Men fight to protect a world that fears them. They are locked in a battle with former colleague and friend, Magneto who believes humans and mutants should never co-exist. ',
      '2hrs 56min',
      '2022-05-02',
      ['War', 'Action', 'Comedy'],
      3000,
      'United States of America'),
  ActionMovieList(
      1,
      'assets/images/action/sin-city.png',
      'Sin City',
      5.9,
      3.5,
      ' In a world filled with hate and prejudice, they are feared by those who cannot accept their differences. Led by Xavier the X-Men fight to protect a world that fears them. They are locked in a battle with former colleague and friend, Magneto who believes humans and mutants should never co-exist.They are children of the atom, homo superior, the next link in the chain of evolution.  In a world filled with hate and prejudice, they are feared by those who cannot accept their differences. Led by Xavier the X-Men fight to protect a world that fears them. They are locked in a battle with former colleague and friend, Magneto who believes humans and mutants should never co-exist. ',
      '2hrs 56min',
      '2022-05-02',
      ['Family', 'Action', 'Drama'],
      370,
      'United States of America'),
];
