# Movie App

Sample Movie Application.

The app is simple, but is ready to scale. It shows a modern approach to developing mobile apps using Flutter.

To see how I used to approach similar problems using native Android development, you can take a look at my other project [BreakingBad](https://github.com/qbait/BreakingBad)

![](screen.gif)

## Packages used

* [get][0] for State Management, Route Management, Dependency Injection, Utils.
* [retrofit][1] for REST api communication.
* [json_serializable][2] for serializing JSON.
* [pedantic][3] for static analysis.
* [mockito][4] for mocking.


[0]: https://pub.dev/packages/get
[1]: https://pub.dev/packages/retrofit
[2]: https://pub.dev/packages/json_serializable
[3]: https://pub.dev/packages/pedantic
[4]: https://pub.dev/packages/mockito

## TODO

* More unit tests
* More widget tests
* Driver tests

## Running

Project uses `build_runner`, please run `flutter pub run build_runner build` before building the project.
