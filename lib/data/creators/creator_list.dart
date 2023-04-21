class CreatorList {
  final String imgUrl;
  final String name;
  final int likes;

  CreatorList(this.imgUrl, this.name, this.likes);

  @override
  String toString() {
    return 'CreatorList{imgUrl: $imgUrl, name: $name, likes: $likes}';
  }
}

List<CreatorList> creatorList = [
  CreatorList('assets/images/creator/james.png', 'James Cameron', 10),
  CreatorList('assets/images/creator/george-lucas.png', 'George Lucas', 1),
  CreatorList('assets/images/creator/martin-scorsese.png', 'Martin Scorsese', 32),
  CreatorList('assets/images/creator/mel-brooks.png', 'Mel Brooks', 24),
  CreatorList('assets/images/creator/ron-howard.png', 'Ron Howard', 15),


];
