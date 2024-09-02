class PlanModel{
  final String id;
  final String image;
  final String name;
  final String address;
  final num price;
  final String date;

  const PlanModel({
    required this.id,
    required this.name,
    required this.image,
    required this.address,
    required this.date,
    required this.price,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      PlanModel(
        id: json['id'] as String,
        name: json['name'] as String,
        image: json['image'] as String,
        address: json['address'] as String,
        date: json['date'] as String,
        price: json['price'] as num,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'address': address,
    'date': date,
    'price': price,
  };
}