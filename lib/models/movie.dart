class Movie {
  String? id;
  String? name;
  String? posterLink;
  String? backdropLink;
  String? rating;
  String? description;

  Movie(this.id, this.name, this.posterLink, this.backdropLink, this.rating,
      this.description);

  Movie.fromJson(Map<String, dynamic> json) {
    //TODO: Handle images being null same as cast
    id = json['id'].toString();
    name = json['title'];
    posterLink = "https://image.tmdb.org/t/p/w185${json['poster_path']}";
    backdropLink = "https://image.tmdb.org/t/p/w500${json['backdrop_path']}";
    rating = json['vote_average'].toString();
    description = json['overview'];
  }

  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['title'] = name;
    data['poster_path'] = posterLink;
    data['backdrop_path'] = backdropLink;
    data['vote_average'] = rating;
    data['overview'] = description;
    return data;
  }
}
