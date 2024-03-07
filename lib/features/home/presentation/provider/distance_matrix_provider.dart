import 'package:core_dreams_innovations/features/home/domain/usecase/distance_matrix_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/distance_model.dart';

final distanceMatrixUseCaseProvider =
    Provider<DistanceMatrixUseCase>((ref) => DistanceMatrixUseCase());
final distanceMatrixProvider =
    StateNotifierProvider<DistanceNotifier, DistanceModel?>(
        (ref) => DistanceNotifier(ref.read(distanceMatrixUseCaseProvider)));

class DistanceNotifier extends StateNotifier<DistanceModel?> {
  final DistanceMatrixUseCase distanceMatrixUseCase;
  DistanceNotifier(this.distanceMatrixUseCase) : super(null);
  Future<void> getDistance({required String start, required String end}) async {
    state = await distanceMatrixUseCase.execute(start: start, end: end);
  }
}
