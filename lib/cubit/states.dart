
abstract class NewsStates {}

class NewsInitialState extends NewsStates{}

class ChangeNavBarState extends NewsStates{}

class BusinessLodingState extends NewsStates{}

class BusinessGetState extends NewsStates{}

class BusinessErorrState extends NewsStates{
  final String erorr;
  BusinessErorrState(this.erorr);
}

class SportsLodingState extends NewsStates{}

class SportsGetState extends NewsStates{}

class SportsErorrState extends NewsStates{
  final String erorr;
  SportsErorrState(this.erorr);
}

class ScienceLodingState extends NewsStates{}

class ScienceGetState extends NewsStates{}

class ScienceErorrState extends NewsStates{
  final String erorr;
  ScienceErorrState(this.erorr);
}

class SearchLodingState extends NewsStates{}

class SearchGetState extends NewsStates{}

class SearchErorrState extends NewsStates{
  final String erorr;
  SearchErorrState(this.erorr);
}

class ChangeAppMode extends NewsStates{}

