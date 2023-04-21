class ActorList {
  final String imgUrl;
  final String name;
  final int likes;

  ActorList(this.imgUrl, this.name, this.likes);

  @override
  String toString() {
    return 'ActorList{imgUrl: $imgUrl, name: $name, likes: $likes}';
  }
}

List<ActorList> actorList = [
  ActorList('assets/images/actor/chris.png', 'Chris Evans', 10),
  ActorList('assets/images/actor/jolie.png', 'Angelina Jolie', 1),
  ActorList('assets/images/actor/kristen.png', 'Kristen Stewart', 32),
  ActorList('assets/images/actor/natasha.png', 'Natasha Lyonne', 24),
  ActorList('assets/images/actor/therock.png', 'Dwayne Johnson', 15),
  ActorList('assets/images/actor/tom-cruise.png', 'Tom Cruise', 19),
  ActorList('assets/images/actor/vindiesel.png', 'Vin Diesel', 20),
  ActorList('assets/images/actor/willsmith.png', 'Will Smith', 20),

];
