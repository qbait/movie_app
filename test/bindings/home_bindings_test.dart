import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/data/repositories/movies_repository_adapter.dart';
import 'package:movie_app/presentation/controllers/home_controller.dart';
import 'package:test/test.dart';

class MockRepository extends Mock implements IMoviesRepository {}

void main() {
  final binding = BindingsBuilder(() {
    Get.lazyPut<IMoviesRepository>(() => MockRepository());
    Get.lazyPut<HomeController>(() => HomeController(repository: Get.find()));
  });

  test('Bindings should be initialized correctly', () {
    expect(Get.isPrepared<HomeController>(), false);
    expect(Get.isPrepared<IMoviesRepository>(), false);

    binding.builder();

    expect(Get.isPrepared<HomeController>(), true);
    expect(Get.isPrepared<IMoviesRepository>(), true);

    Get.reset();
  });
}
