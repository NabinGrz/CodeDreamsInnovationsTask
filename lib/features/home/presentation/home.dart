import 'package:core_dreams_innovations/core/constants/app_colors.dart';
import 'package:core_dreams_innovations/core/constants/app_styles.dart';
import 'package:core_dreams_innovations/core/constants/text_styles.dart';
import 'package:core_dreams_innovations/features/home/presentation/provider/home_provider.dart';
import 'package:core_dreams_innovations/shared/widgets/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late final GoogleMapController _controller;
  void listenToLocationProvider() async {
    ref.listen(locationProvider.select((value) => value), (previous, next) {
      if (next.position != null) {
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 16,
              target: LatLng(
                next.position!.latitude,
                next.position!.longitude,
              ),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    listenToLocationProvider();
    final locationState = ref.watch(locationProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: locationState.isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : Stack(
              children: [
                GoogleMap(
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    zoom: 16,
                    target: locationState.position != null
                        ? LatLng(locationState.position!.latitude,
                            locationState.position!.longitude)
                        : const LatLng(0.0, 0.0),
                  ),
                  onMapCreated: (controller) async {
                    _controller = controller;
                    await ref
                        .read(locationProvider.notifier)
                        .checkLocationPermission(context);
                  },
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.3,
                  maxChildSize: 0.95,
                  minChildSize: 0.3,
                  expand: true,
                  snap: true,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.r),
                          topRight: Radius.circular(25.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.43),
                            spreadRadius: 6,
                            blurRadius: 20,
                          )
                        ],
                      ),
                      child: CustomScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        controller: scrollController,
                        shrinkWrap: true,
                        slivers: [
                          SliverPadding(
                            padding: EdgeInsets.all(screenMargin),
                            sliver: SliverToBoxAdapter(
                              child: Text(
                                'At your service Mr Walker',
                                style: bold().copyWith(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SliverPadding(
                            padding:
                                EdgeInsets.symmetric(horizontal: screenMargin),
                            sliver: SliverList.list(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.backgroundGreyColor,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  padding: const EdgeInsets.all(12),
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
                                sizedBox(20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    item(
                                      iconData: Icons.home_outlined,
                                      name: "Home",
                                    ),
                                    item(
                                      iconData:
                                          Icons.local_post_office_outlined,
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
                          ),
                        ],
                      ),
                    );
                  },
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
