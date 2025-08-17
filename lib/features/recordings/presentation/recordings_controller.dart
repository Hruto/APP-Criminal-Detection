import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/di.dart';
import '../data/recordings_api.dart';
import '../data/recordings_repo_impl.dart';
import '../domain/recording.dart';
import '../domain/recordings_repo.dart';

final recordingsRepoProvider = Provider<RecordingsRepo>((ref) {
  final dio = ref.watch(dioProvider);
  return RecordingsRepoImpl(RecordingsApi(dio));
});

class RecordingsController extends StateNotifier<AsyncValue<List<Recording>>> {
  final RecordingsRepo repo;
  RecordingsController(this.repo) : super(const AsyncLoading());

  Future<void> fetch(String cameraId,
      {DateTime? from, DateTime? to, bool presign = true}) async {
    state = const AsyncLoading();
    try {
      final items = await repo.list(
        cameraId: cameraId,
        from: from,
        to: to,
        presign: presign,
      );
      state = AsyncData(items);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

final recordingsControllerProvider = StateNotifierProvider.autoDispose<
    RecordingsController, AsyncValue<List<Recording>>>((ref) {
  return RecordingsController(ref.watch(recordingsRepoProvider));
});
