import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/data/repositories/movies_repository_adapter.dart';
import 'package:movie_app/presentation/controllers/home_controller.dart';

class MockRepository extends Mock implements IMoviesRepository {}

void main() {
  group('Test Home Controller', () {
    IMoviesRepository repository;
    BindingsBuilder binding;

    setUp(() {
      repository = MockRepository();

      binding = BindingsBuilder(() {
        Get.lazyPut<IMoviesRepository>(() => repository);
        Get.lazyPut<HomeController>(() => HomeController(repository: Get.find()));
      });

      binding.builder();
    });

    tearDown(() {
      Get.delete<IMoviesRepository>();
      Get.delete<HomeController>();
    });

    test('Should be correctly initialized', () async {
      when(repository.getPopular(1)).thenAnswer((_) => Future.value([]));

      final controller = Get.find<HomeController>();

      expect(controller.initialized, true);

      expect(controller.status.value, Status.loading);
    });

    test('Should fetch correct movies', () async {
      final movies = [
        Movie(title: 'Fight Club'),
        Movie(title: 'Snatch'),
        Movie(title: 'American Beauty'),
      ];

      when(repository.getPopular(1)).thenAnswer(
        (_) => Future.value(movies),
      );

      final controller = Get.find<HomeController>();

      await Future.delayed(Duration(milliseconds: 100));

      expect(controller.movies.length, 3);
      expect(controller.movies[0].title, 'Fight Club');
      expect(controller.movies[1].title, 'Snatch');
      expect(controller.movies[2].title, 'American Beauty');
    });

    test('Should handle error', () async {
      when(repository.getPopular(any)).thenAnswer((_) => Future.error('error'));

      final controller = Get.find<HomeController>();

      await Future.delayed(Duration(milliseconds: 100));

      expect(controller.movies.length, 0);
    });
  });
}
