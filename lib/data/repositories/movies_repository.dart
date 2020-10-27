import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/data/remote/movie_api_client.dart';
import 'package:movie_app/data/repositories/movies_repository_adapter.dart';
import 'package:movie_app/utils/constants.dart';

class MoviesRepository implements IMoviesRepository {
  MoviesRepository({this.apiClient});

  final MovieApiClient apiClient;

  @override
  Future<List<Movie>> getPopular(int page) async {
    try {
      final popular = await apiClient.getPopular(API_KEY, page);
      return popular.results;
    } on Exception catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
