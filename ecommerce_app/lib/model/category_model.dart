class Categoery {
  String? title;
  String? image;

  Categoery({required this.title, this.image});
}

List<Categoery> categories = [
  Categoery(title: "GROCERY", image: "assets/grocery.png"),
  Categoery(title: "ELECTRONIC", image: "assets/electronics.png"),
  Categoery(title: "GARMENTS", image: "assets/garments.png"),
  Categoery(title: "COSMATICS", image: "assets/cosmatics.png"),
  Categoery(title: "PHARMACY", image: "assets/pharmacy.png"),
];
