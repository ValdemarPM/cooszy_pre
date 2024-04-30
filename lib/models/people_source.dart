class PeopleSource {
  // GETTER
  List<People> get myPeople => _myPeople;

  final List<People> _myPeople = [
    People(
        thumbPath: "assets/images/people/angeles.jpg",
        name: "Angeles Remacha",
        level: "Intimate friend"),
    People(
        thumbPath: "assets/images/people/dani.jpg",
        name: "Dani Casado",
        level: "Casual friend"),
    People(
        thumbPath: "assets/images/people/francisco.jpg",
        name: "Fran Dominguez",
        level: "Close friend"),
  ];
}

class People {
  final String thumbPath;
  final String name;
  final String level;

  People({required this.thumbPath, required this.name, required this.level});
}
