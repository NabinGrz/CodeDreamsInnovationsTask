import 'package:core_dreams_innovations/features/home/data/datasource/distance_data_source.dart';
import 'package:core_dreams_innovations/features/home/domain/repositories/distance_repository_impl.dart';
import 'package:core_dreams_innovations/features/home/domain/usecase/distance_matrix_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/distance_model.dart';
import '../../data/repositories/distance_repository.dart';

final distanceDataSourceProvider =
    Provider<DistanceDataSource>((ref) => DistanceDataSourceImpl());
final distanceRepostioryProvider = Provider<DistanceRepository>((ref) =>
    DistanceRepositoryImpl(
        distanceDataSource: ref.read(distanceDataSourceProvider)));
final distanceMatrixUseCaseProvider = Provider<DistanceMatrixUseCase>((ref) =>
    DistanceMatrixUseCase(
        distanceRepository: ref.read(distanceRepostioryProvider)));
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
