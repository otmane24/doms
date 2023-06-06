class Doctor {
  String? id;
  String imagePath;
  String name;
  String specialty;
  int vote_count;
  bool? is_online;
  bool? is_like;
  String? description;
  String? address;

  Doctor({
    this.id,
    required this.imagePath,
    required this.name,
    required this.specialty,
    required this.vote_count,
    this.is_online,
    this.description,
    this.address,
    this.is_like,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? 0,
      imagePath: json['avatar'] ?? '',
      name: json['name'] ?? '',
      specialty: json['expertise'] ?? '',
      vote_count: json['rating'] ?? 0,
      is_online: json['is_online'] ?? false,
      is_like: json['is_online'] ?? false,
      description: json['about'] ?? '',
      address: json['adress'] ?? '',
    );
  }
}
