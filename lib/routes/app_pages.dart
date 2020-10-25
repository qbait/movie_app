import 'package:get/get.dart';
import 'package:movie_app/bindings/home_binding.dart';
import 'package:movie_app/presentation/views/details_view.dart';
import 'package:movie_app/presentation/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => DetailsView(),
    ),
  ];
}
