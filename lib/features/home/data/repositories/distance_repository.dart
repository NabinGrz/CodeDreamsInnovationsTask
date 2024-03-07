import '../models/distance_model.dart';

abstract class DistanceRepository {
  Future<DistanceModel?> getExecute(
      {required String start, required String end});
}
