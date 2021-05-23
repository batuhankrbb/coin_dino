import 'package:background_fetch/background_fetch.dart';

class BackgroundHelper {
  Future<void> initializeBackground() async {
    await BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 15,
            stopOnTerminate: false,
            enableHeadless: true,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false,
            requiredNetworkType: NetworkType.NONE), (String taskId) async {
      //!
      BackgroundFetch.finish(taskId);
    }, (String taskId) async {
      //!
      BackgroundFetch.finish(taskId);
    });

    //*  BackgroundFetch.start()  background fetch başlatma kodu
    //* BackgroundFetch.stop()    background fetch bitirme kodu
    //* BackgroundFetch.status background fetch durumunu öğrenme kodu [DENIDED, RESTRICTED, AVAILABLE]
  }

  Future<void> startBackgroundFetch() async{
    await BackgroundFetch.start();
  }

  Future<void> stopBackgroundFetch() async{
    await BackgroundFetch.stop();
  }

}
