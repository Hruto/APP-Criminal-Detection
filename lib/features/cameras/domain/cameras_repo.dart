import 'camera.dart';

abstract class CamerasRepo {
  Future<List<Camera>> list();
  Future<Camera> getById(String id);
}
