abstract class ISensorsService {
  Stream<dynamic> getAccelerometerStream();
  Stream<dynamic> getGyroscopeStream();
  Stream<dynamic> getMagnetometerStream();
  Stream<dynamic> getBarometerStream();
}
