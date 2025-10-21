class Movie {
  final String title;
  final String year;
  final String rated;
  final String released;
  final String director;
  final String writer;
  final String actors;
  final String language;
  final String country;
  final String poster;
  final String type;
  final String images;
  final String plot;
  final String description;

  Movie({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.director,
    required this.writer,
    required this.actors,
    required this.language,
    required this.country,
    required this.poster,
    required this.type,
    required this.images,
    required this.plot,
    required this.description,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] as String,
      year: json['year'] as String,
      rated: json['rated'] as String,
      released: json['released'] as String,
      director: json['director'] as String,
      writer: json['writer'] as String,
      actors: json['actors'] as String,
      language: json['language'] as String,
      country: json['country'] as String,
      poster: json['poster'] as String,
      type: json['type'] as String,
      images: json['images'] as String,
      plot: json['plot'] as String,
      description: json['description'] as String,
    );
  }
}
