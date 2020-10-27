import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:test/test.dart';

void main() {
  test('Poster url should be correctly generated', () {
    final path = 'sample/file.jpg';
    final movie = Movie(posterPath: path);

    expect(movie.posterUrl, '$IMAGE_BASE_URL$path');
  });
}
