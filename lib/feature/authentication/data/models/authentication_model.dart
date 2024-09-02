
class AuthenticationModel {
  final String uid;
  final String image;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String createAt;

  const AuthenticationModel({
    required this.uid,
    required this.email,
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.createAt,
  });

factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
    AuthenticationModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      gender: json['gender'] as String,
      createAt: json['create_at'] as String,
    );

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'image': image,
    'first_name': firstName,
    'last_name': lastName,
    'gender': gender,
    'create_at': createAt,
  };

}
