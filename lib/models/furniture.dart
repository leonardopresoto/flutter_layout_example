class Furniture {
  String title;
  String photo;
  String description;
  int price;

  Furniture({this.title, this.photo, this.description, this.price});

  Furniture.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    photo = json['photo'];
    description = json['description'];
    price = json['price'];
  }
}