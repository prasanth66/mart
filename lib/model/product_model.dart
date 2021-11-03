

class ProductModel {
  ProductModel({
    required this.name,
    required this.rating,
    required this.description,
    required this.date,
    this.image = "",
  });
  String name;
  int rating ;
  String description;
  String date ;
  String image ;
}