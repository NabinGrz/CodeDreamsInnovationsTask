import 'package:core_dreams_innovations/features/home/presentation/provider/distance_matrix_provider.dart';
import 'package:core_dreams_innovations/features/home/presentation/provider/select_place_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:async';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/constants/text_styles.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../../../shared/widgets/sizebox.dart';
import '../data/models/place_model.dart';
import '../presentation/provider/location_provider.dart';
import '../presentation/provider/place_provider.dart';
import '../presentation/provider/search_place_provider.dart';
import 'place_item_widget.dart';

class ContenWidget extends ConsumerStatefulWidget {
  final DraggableScrollableController dragController;
  final TextEditingController startController;
  final TextEditingController destinationController;
  const ContenWidget(
      this.dragController, this.startController, this.destinationController,
      {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContenWidgetState();
}

class _ContenWidgetState extends ConsumerState<ContenWidget> {
  GoogleMapAPINotifier get googleApiNotifier =>
      ref.read(googleApiProvider.notifier);
  SearchPlaceNotifier get searchPlaceNotifier =>
      ref.read(searchPlaceProvider.notifier);
  SelectPlaceNotifier get selectPlaceNotifier =>
      ref.read(selectPlaceProvider.notifier);

  List<Description> get places => ref.watch(searchPlaceProvider);
  Timer? _debounce;
  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: screenMargin),
      sliver: SliverList.list(
        children: [
          if (ref.watch(distanceMatrixProvider) != null) ...{
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Distance: ${ref.watch(distanceMatrixProvider)?.rows?.first.elements?.first.distance?.text}",
                  style: regular().copyWith(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
                sizedBox(10),
                Text(
                  "Travel Time: ${ref.watch(distanceMatrixProvider)?.rows?.first.elements?.first.duration?.text}",
                  style: regular().copyWith(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            sizedBox(20),
          },
          ref.watch(isExpanded)
              ? Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundGreyColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextField(
                                controller: widget.startController,
                                hintText: "Start"),
                            const Divider(
                              color: AppColors.textColor,
                              thickness: 0.2,
                              height: 1,
                            ),
                            CustomTextField(
                              controller: widget.destinationController,
                              hintText: "Destination",
                              onChanged: (pattern) async {
                                if (_debounce?.isActive ?? false) {
                                  _debounce?.cancel();
                                }
                                _debounce = Timer(
                                    const Duration(milliseconds: 300),
                                    () async => await searchPlaceNotifier
                                        .searchPlace(pattern, ref));
                              },
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        color: AppColors.textGreyColor,
                        size: 40.w,
                      )
                    ],
                  ),
                )
              : InkWell(
                  onTap: () => widget.dragController.animateTo(1,
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut),
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundGreyColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: AppColors.yellowColor,
                        ),
                        sizedBox(10),
                        Text(
                          "Where do you want to go sir?",
                          style: light().copyWith(
                            fontSize: 18.sp,
                            color: AppColors.textGreyColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          if (ref.watch(isExpanded)) ...{
            Consumer(
              builder: (context, ref, child) {
                return places.isEmpty
                    ? const SizedBox.shrink()
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: AppColors.textGreyColor,
                            height: 6,
                          );
                        },
                        shrinkWrap: true,
                        itemCount: places.length,
                        itemBuilder: (context, index) {
                          final place = places[index];
                          return InkWell(
                            onTap: () async {
                              widget.destinationController.text =
                                  place.description ?? "";
                              await selectPlaceNotifier.onSelectPlace(
                                  place, ref);
                            },
                            child: PlaceItemWidget(place: place),
                          );
                        },
                      );
              },
            )
          },
          sizedBox(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              item(
                iconData: Icons.home_outlined,
                name: "Home",
              ),
              item(
                iconData: Icons.local_post_office_outlined,
                name: "Office",
              ),
              item(
                iconData: Icons.airplane_ticket_outlined,
                name: "Airport",
              ),
              item(
                iconData: Icons.add,
                name: "Add",
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget item({required String name, required IconData iconData}) {
    return Container(
      margin: EdgeInsets.only(right: 18.w),
      child: Column(
        children: [
          Icon(
            iconData,
            color: AppColors.yellowColor,
            size: 32.w,
          ),
          Text(
            name,
            style: light().copyWith(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          )
        ],
      ),
    );
  }
}
