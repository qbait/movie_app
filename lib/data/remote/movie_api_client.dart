import 'package:dio/dio.dart';
import 'package:movie_app/data/models/movie_results.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api_client.g.dart';

@RestApi(baseUrl: base_url)
abstract class MovieApiClient {
  factory MovieApiClient(Dio dio, {String baseUrl}) = _MovieApiClient;

  @GET('movie/popular')
  Future<MovieResults> getPopular(@Query('api_key') String apiKey, @Query('page') int page);
}
