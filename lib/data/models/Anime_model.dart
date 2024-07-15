// ignore_for_file: public_member_api_docs, sort_constructors_first
class Anime {
  String? nameEn;
  String? nameEnJp;
  String? nameJp;
  String? description;
  String? averageRating;
  String? startDate;
  String? endDate;
  String? posterImage="";
  String? coverImage="";
  String? status;
  int? popularityRank;
  int? userCount;
  int? favoritesCount;
  Anime({
    required this.nameEn,
    required this.nameEnJp,
    required this.nameJp,
    required this.description,
    required this.averageRating,
    required this.startDate,
    required this.endDate,
    required this.posterImage,
    required this.coverImage,
    required this.status,
    required this.popularityRank,
    required this.userCount,
    required this.favoritesCount,
  });
  Anime.fromJson(Map<String, dynamic> json){
    nameEn = json['titles']['en'];
    nameEnJp = json['titles']['en_jp'];
    nameJp = json['titles']['ja_jp'];
    description = json['description'];
    averageRating = json['averageRating'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    posterImage = json['posterImage']!['large']!;
    coverImage = json['coverImage']!['large']!;
    status = json['status'];
    popularityRank = json['popularityRank'];
    userCount = json['userCount'];
    favoritesCount = json['favoritesCount'];
  }
}
