import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/di.dart';
import '../../data/cameras_api.dart';
import '../../data/cameras_repo_impl.dart';
import '../../domain/camera.dart';
import '../../domain/cameras_repo.dart';

final camerasRepoProvider = Provider<CamerasRepo>((ref) {
  final dio = ref.watch(dioProvider);
  return CamerasRepoImpl(CamerasApi(dio));
});

final camerasListProvider =
    FutureProvider.autoDispose<List<Camera>>((ref) async {
  return ref.watch(camerasRepoProvider).list();
});

final cameraByIdProvider =
    FutureProvider.autoDispose.family<Camera, String>((ref, id) async {
  return ref.watch(camerasRepoProvider).getById(id);
});
