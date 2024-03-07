import 'package:core_dreams_innovations/features/home/data/datasource/distance_data_source.dart';
import 'package:core_dreams_innovations/features/home/data/models/distance_model.dart';

import '../../data/repositories/distance_repository.dart';

class DistanceRepositoryImpl implements DistanceRepository {
  final DistanceDataSource distanceDataSource;

  DistanceRepositoryImpl({required this.distanceDataSource});
  @override
  Future<DistanceModel?> getExecute(
      {required String start, required String end}) async {
    return await distanceDataSource.getExecute(start: start, end: end);
  }
}
