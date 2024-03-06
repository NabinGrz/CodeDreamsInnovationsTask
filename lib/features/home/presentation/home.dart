import 'package:core_dreams_innovations/core/constants/app_colors.dart';
import 'package:core_dreams_innovations/core/constants/app_styles.dart';
import 'package:core_dreams_innovations/core/constants/text_styles.dart';
import 'package:core_dreams_innovations/features/home/presentation/provider/location_provider.dart';
import 'package:core_dreams_innovations/features/home/widget/content.dart';
import 'package:core_dreams_innovations/shared/widgets/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/header.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late final GoogleMapController _controller;
  final dragController = DraggableScrollableController();
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
                  myLocationButtonEnabled: false,
                  myLocationEnabled: false,
                  zoomControlsEnabled: false,
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
                NotificationListener<DraggableScrollableNotification>(
                  onNotification:
                      (DraggableScrollableNotification dSNotification) {
                    ref
                        .read(isExpanded.notifier)
                        .update((state) => dSNotification.extent > 0.9);

                    return dSNotification.extent > 0.9;
                  },
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.3,
                    maxChildSize: 1,
                    minChildSize: 0.3,
                    expand: true,
                    snap: true,
                    controller: dragController,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: ref.watch(isExpanded)
                              ? null
                              : BorderRadius.only(
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
                            (ref.watch(isExpanded))
                                ? const Header()
                                : SliverPadding(
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
                            // sizedBox(10),
                            SliverPadding(padding: EdgeInsets.all(6.h)),
                            ContenWidget(dragController),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
