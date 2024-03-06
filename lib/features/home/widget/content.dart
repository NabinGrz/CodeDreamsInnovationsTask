import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/constants/text_styles.dart';
import '../../../shared/widgets/sizebox.dart';
import '../presentation/provider/location_provider.dart';
import '../presentation/provider/place_provider.dart';

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
  @override
  Widget build(
    BuildContext context,
  ) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: screenMargin),
      sliver: SliverList.list(
        children: [
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
                            TextFormField(
                              readOnly: true,
                              controller: widget.startController,
                              style: regular().copyWith(
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                hintText: "Start",
                                hintStyle: regular().copyWith(
                                  fontSize: 20.sp,
                                  color: AppColors.textGreyColor,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                            const Divider(
                              color: AppColors.textColor,
                              thickness: 0.2,
                              height: 1,
                            ),
                            TextFormField(
                              controller: widget.destinationController,
                              style: regular().copyWith(
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                hintText: "Destination",
                                hintStyle: regular().copyWith(
                                  fontSize: 20.sp,
                                  color: AppColors.textGreyColor,
                                ),
                                border: InputBorder.none,
                              ),
                              onChanged: (pattern) async {
                                var predictionModel = await googleApiNotifier
                                    .placeAutoComplete(placeInput: pattern);

                                if (predictionModel != null) {
                                  final places = predictionModel.predictions!
                                      .where((element) => element.description!
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()))
                                      .toList();
                                  ref
                                      .read(placesProvider.notifier)
                                      .update((state) => places);
                                } else {
                                  // return [];
                                }
                              },
                            ),
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
            ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  color: AppColors.textGreyColor,
                  height: 6,
                );
              },
              shrinkWrap: true,
              itemCount: ref.watch(placesProvider).length,
              itemBuilder: (context, index) {
                final place = ref.watch(placesProvider)[index];
                return InkWell(
                  onTap: () async {
                    final data = await googleApiNotifier
                        .placeToLatLng(place.place_id ?? "");
                    final latlng = LatLng(
                      data?.geometry?.location?.lat ?? 0,
                      data?.geometry?.location?.lng ?? 0,
                    );
                    ref
                        .read(destinationProvider.notifier)
                        .update((state) => latlng);
                    widget.destinationController.text = place.description ?? "";
                    ref.read(placesProvider.notifier).update((state) => []);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 18.w,
                        ),
                        sizedBox(10),
                        Expanded(
                          child: Text(
                            "${place.description}",
                            style: regular().copyWith(
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
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
