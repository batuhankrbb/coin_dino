import 'package:background_fetch/background_fetch.dart';

class BackgroundHelper {
  static final shared = BackgroundHelper._privateConstructor();

  BackgroundHelper._privateConstructor();

  Future<void> initializeBackground(Function fetchFunction) async {
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
              //receive
      await fetchFunction();
      BackgroundFetch.finish(taskId);
    }, (String taskId) async {
      //timeout
      BackgroundFetch.finish(taskId);
    });
  }

  Future<void> startBackgroundFetch() async {
    await BackgroundFetch.start();
  }

  Future<void> stopBackgroundFetch() async {
    await BackgroundFetch.stop();
  }

  
}
