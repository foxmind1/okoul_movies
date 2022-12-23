class Movie {
  String? id;
  String? name;
  String? posterLink;
  String? backdropLink;
  String? rating;
  String? numOfReviews;
  String? description;

  Movie(this.id, this.name, this.posterLink, this.backdropLink, this.rating,
      this.numOfReviews, this.description);

  Movie.fromJson(Map<String, dynamic> json) {
    //TODO: Handle images being null same as cast
    id = json['id'].toString();
    name = json['title'];
    posterLink = "https://image.tmdb.org/t/p/w185${json['poster_path']}";
    backdropLink = "https://image.tmdb.org/t/p/w500${json['backdrop_path']}";
    rating = json['vote_average'].toStringAsPrecision(3);
    numOfReviews = json['vote_count'].toString();
    description = json['overview'];
  }

  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['title'] = name;
    data['poster_path'] = '/${posterLink!.split('/')[6]}';
    data['backdrop_path'] = '/${backdropLink!.split('/')[6]}';
    data['vote_average'] = double.parse(rating!);
    data['vote_count'] = int.parse(numOfReviews!);
    data['overview'] = description;
    return data;
  }
}
