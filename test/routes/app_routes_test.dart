import 'package:get/get.dart';
import 'package:get_test/get_test.dart';
import 'package:movie_app/routes/app_pages.dart';
import 'package:test/test.dart';

void main() {
  getTest(
    'App Routes should hve correct flow',
    getPages: AppPages.routes,
    initialRoute: AppPages.INITIAL,
    widgetTest: (tester) async {
      await tester.pumpAndSettle(Duration(milliseconds: 500));

      expect('/home', Get.currentRoute);

      await Get.toNamed('/details');
      expect('/details', Get.currentRoute);

      Get.back();

      expect('/home', Get.currentRoute);
    },
  );
}
