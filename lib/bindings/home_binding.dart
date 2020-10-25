import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/remote/movie_api_client.dart';
import 'package:movie_app/data/repositories/movies_repository.dart';
import 'package:movie_app/data/repositories/movies_repository_adapter.dart';
import 'package:movie_app/presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => MovieApiClient(Get.find()));
    Get.lazyPut<IMoviesRepository>(() => MoviesRepository(apiClient: Get.find()));
    Get.lazyPut(() => HomeController(repository: Get.find()));
  }
}
