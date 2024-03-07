import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/place_model.dart';
import '../../domain/usecase/place_usecase.dart';
import 'place_provider.dart';

final searchPlaceProvider =
    StateNotifierProvider<SearchPlaceNotifier, List<Description>>(
        (ref) => SearchPlaceNotifier(
              placeUseCase: ref.read(placeUseCaseProvider),
            ));

class SearchPlaceNotifier extends StateNotifier<List<Description>> {
  final PlaceAutocompleteUseCase placeUseCase;
  SearchPlaceNotifier({
    required this.placeUseCase,
  }) : super([]);
  void clearSuggestions() {
    state = [];
  }

  Future<void> searchPlace(String pattern, WidgetRef ref) async {
    if (pattern.length >= 3) {
      var predictionModel = await placeUseCase.execute(pattern);
      if (predictionModel != null) {
        final places = predictionModel.predictions!
            .where((element) => element.description!
                .toLowerCase()
                .contains(pattern.toLowerCase()))
            .toList();

        state = places;
      }
    } else {
      state = [];
    }
  }
}
