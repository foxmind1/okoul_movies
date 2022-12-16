class Movie {
  String? id;
  String? name;
  String? posterLink;
  String? rating;
  String? description;
  // List<Cast>? cast; // TODO: What to do

  Movie(this.id, this.name, this.posterLink, this.rating, this.description);

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['title'];
    description = json['overview'];
    posterLink = "https://image.tmdb.org/t/p/w185/${json['poster_path']}";
    rating = json['vote_average'].toString();
  }

  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['title'] = name;
    data['overview'] = description;
    data['poster_path'] = posterLink;
    data['vote_average'] = rating;
    return data;
  }
}
