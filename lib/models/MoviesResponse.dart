class Results {
  final adult;
  final backdropPath;
  final id;
  final originalLanguage;
  final originalTitle;
  final overview;
  final popularity;
  final posterPath;
  final releaseDate;
  final title;
  final video;
  final voteAverage;
  final voteCount;
  final List<num> genreIds;

  Results(
      {this.adult,
      this.backdropPath,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.genreIds});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
        genreIds: List<num>.from(json['genre_ids']));
  }
}

class MoviesResponse {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<Results> results;

  MoviesResponse({this.page, this.totalPages, this.totalResults, this.results});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    return MoviesResponse(
        page: json['page'],
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
        results: list.map((i) => Results.fromJson(i)).toList());
  }
}
