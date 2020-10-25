import 'package:movie_app/data/models/movie.dart';

// ignore: one_member_abstracts
abstract class IMoviesRepository {
  Future<List<Movie>> getPopular(int page);
}
