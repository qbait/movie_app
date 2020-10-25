import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';

part 'movie_results.g.dart';

@JsonSerializable()
class MovieResults {
  @JsonKey(name: 'results')
  final List<Movie> results;

  const MovieResults([this.results = const []]);

  factory MovieResults.fromJson(Map<String, dynamic> json) => _$MovieResultsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResultsToJson(this);
}
