extension Adds on String{
  String getMovie (int count){

    if(count==1){
      return 'You liked $count movie';
    }
    return 'You liked $count movies';
  }
  String getVote (int count){

    if(count==1){
      return '$count VOTE';
    }
    return '$count VOTES';
  }
}