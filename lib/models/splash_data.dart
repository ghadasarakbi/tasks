class SplashData {
  final int id;
  final String title;
  final String description;
  final String image;

  SplashData({required this.id, required this.title, required this.description, required this.image});

  factory SplashData.fromJson(Map<String, dynamic> json) {
    return SplashData(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}
