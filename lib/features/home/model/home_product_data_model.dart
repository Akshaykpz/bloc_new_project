class ProductDataModel {
  final String id;
  final String name;
  final String description;
  final String price;

  final String imageurl;

  ProductDataModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.imageurl});
}
