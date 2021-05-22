class AlertEntity {
  final String coindID;
  final String name;
  final String image;
  final double targetPrice;
  final double price;


  AlertEntity(
      {required this.coindID,
      required this.name,
      required this.image,
      required this.targetPrice, required this.price});
}
