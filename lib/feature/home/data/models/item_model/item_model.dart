class ItemModel {
  final List<String> images;
  final String name;
  final String description;
  final String id;
  final String location;
  final String address;
  final num price;

  const ItemModel({
    required this.images,
    required this.name,
    required this.description,
    required this.id,
    required this.address,
    required this.location,
    required this.price,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'],
      images: json['images'].cast<String>(),
      description: json['description'],
      id: json['id'],
      price: json['price'],
      address: json['address'],
      location: json['location'],
    );
  }

  Map<String,dynamic> toJson()=>{
    'name':name,
    'images':images,
    'description':description,
    'id':id,
    'price':price,
    'address':address,
    'location':location,
  };

}
