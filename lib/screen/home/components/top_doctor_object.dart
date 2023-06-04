class DoctorObject {
  String imagePath;
  String name;
  String specialty;
  String vote_average;
  String vote_count;
  bool is_online;
  bool? is_like;
  String? description;

  DoctorObject({
    required this.imagePath,
    required this.name,
    required this.specialty,
    required this.vote_average,
    required this.vote_count,
    required this.is_online,
    this.description,
    this.is_like,
  });
}
