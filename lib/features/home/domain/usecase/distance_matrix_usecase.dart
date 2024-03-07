
import 'package:core_dreams_innovations/features/home/data/models/distance_model.dart';
import 'package:core_dreams_innovations/features/home/data/repositories/distance_repository.dart';


class DistanceMatrixUseCase {
  final DistanceRepository distanceRepository;

  DistanceMatrixUseCase({required this.distanceRepository});
  Future<DistanceModel?> execute(
      {required String start, required String end}) async {
    return await distanceRepository.getExecute(start: start, end: end);
  }
}
