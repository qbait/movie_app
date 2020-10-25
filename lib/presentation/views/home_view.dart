import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/controllers/home_controller.dart';
import 'package:movie_app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: Obx(
        () => (controller.status() != Status.error) ? _moviesList() : _error(),
      ),
    );
  }

  Widget _error() {
    return Center(
      child: Text('Error when fetching movies'),
    );
  }

  Widget _moviesList() {
    return ListView(
      controller: controller.scrollController,
      children: [
        ...controller.movies.map(
          (movie) => ListTile(
            title: Text(movie.title),
            onTap: () {
              Get.toNamed(Routes.DETAILS, arguments: movie);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
