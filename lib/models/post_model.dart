class PostModel {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  //constructor
  PostModel(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.avatar});

//buat contructor custom
  PostModel.fromRegres(Map<String, dynamic> regres) {
    id = regres['id'];
    email = regres['email'];
    first_name = regres['first_name'];
    last_name = regres['last_name'];
    avatar = regres['avatar'];
  }
}
