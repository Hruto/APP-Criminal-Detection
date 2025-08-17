import '../domain/cameras_repo.dart';
import '../domain/camera.dart';
import 'cameras_api.dart';

class CamerasRepoImpl implements CamerasRepo {
  final CamerasApi api;
  CamerasRepoImpl(this.api);

  @override
  Future<List<Camera>> list() => api.list();

  @override
  Future<Camera> getById(String id) => api.getById(id);
}
