import 'package:background_fetch/background_fetch.dart';

class BackgroundHelper {
  static final shared = BackgroundHelper();

  Future<void> initializeBackground(Function fetchFunction,
      Function timeoutFunction, Function headlessTask) async {
    await BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 15,
            stopOnTerminate: false,
            enableHeadless: true,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false,
            requiredNetworkType: NetworkType.ANY), (String taskId) async {
      await fetchFunction();
      BackgroundFetch.finish(taskId);
    }, (String taskId) async {
      await timeoutFunction();
      BackgroundFetch.finish(taskId);
    });

    await BackgroundFetch.registerHeadlessTask(headlessTask);
  }

  Future<void> startBackgroundFetch() async {
    await BackgroundFetch.start();
  }

  Future<void> stopBackgroundFetch() async {
    await BackgroundFetch.stop();
  }
}
