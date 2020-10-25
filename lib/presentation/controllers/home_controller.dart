import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/data/repositories/movies_repository_adapter.dart';

enum Status { loading, success, error }

class HomeController extends GetxController {
  HomeController({this.repository});

  final IMoviesRepository repository;

  ScrollController scrollController;

  final status = Status.loading.obs;

  final movies = RxList<Movie>();

  int _currentPage = 1;

  @override
  void onInit() {
    _initScrollController();
    _fetchDataFromApi(_currentPage++);
  }

  void _initScrollController() {
    scrollController = ScrollController()
      ..addListener(() {
        final triggerFetchMoreSize = 0.9 * scrollController.position.maxScrollExtent;

        if (scrollController.position.pixels > triggerFetchMoreSize) {
          _fetchDataFromApi(_currentPage++);
        }
      });
  }

  Future<void> _fetchDataFromApi(int page) async {
    return repository.getPopular(page).then(
      (results) {
        movies.addAll(results);
        status(Status.success);
      },
      onError: (error) {
        print('fetchDataFromApi, error: $error');
        return status(Status.error);
      },
    );
  }
}
