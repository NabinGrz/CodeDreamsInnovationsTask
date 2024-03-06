import 'dart:async';

import 'package:core_dreams_innovations/core/constants/app_colors.dart';
import 'package:core_dreams_innovations/core/constants/app_styles.dart';
import 'package:core_dreams_innovations/core/constants/text_styles.dart';
import 'package:core_dreams_innovations/features/home/presentation/provider/location_provider.dart';
import 'package:core_dreams_innovations/features/home/presentation/provider/place_provider.dart';
import 'package:core_dreams_innovations/features/home/widget/content.dart';
import 'package:core_dreams_innovations/shared/widgets/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late final GoogleMapController mapController;
  // Completer<GoogleMapController> _controller = Completer();

  final dragController = DraggableScrollableController();
  final startController = TextEditingController();
  final destinationController = TextEditingController();
  void listenToLocationProvider() async {
    ref.listen(locationProvider.select((value) => value),
        (previous, next) async {
      if (next.position != null) {
        // final controller = await _controller.future;
        mapController.animateCamera(
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

        final address = await Repo.latlngToPlace(
            "${next.position!.latitude},${next.position!.longitude}");
        startController.text = address?.formatted_address ?? "";
        print("PLAPALPALAP${startController.text}");
      }
      // if (next.position != null && ref.watch(destinationProvider) != null) {
      //   final controller = await _controller.future;
      //   await Repo.updateCameraLocationToZoomBetweenTwoMarkers(
      //       LatLng(next.position!.latitude, next.position!.longitude),
      //       ref.watch(destinationProvider)!,
      //       _controller,
      //       controller);
      // }
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
                  style: ref.watch(mapStyleProvider).value,
                  myLocationButtonEnabled: false,
                  myLocationEnabled: false,
                  zoomControlsEnabled: false,
                  polylines: {ref.watch(routesProvider)},
                  markers: {
                    if (ref.watch(destinationProvider) != null) ...{
                      Marker(
                          markerId: const MarkerId("1"),
                          position: ref.watch(destinationProvider)!)
                    },
                    if (locationState.position != null) ...{
                      Marker(
                          markerId: const MarkerId("2"),
                          position: LatLng(locationState.position!.latitude,
                              locationState.position!.longitude))
                    }
                  },
                  initialCameraPosition: CameraPosition(
                    zoom: 16,
                    target: locationState.position != null
                        ? LatLng(locationState.position!.latitude,
                            locationState.position!.longitude)
                        : const LatLng(0.0, 0.0),
                  ),
                  onMapCreated: (controller) async {
                    // _controller = controller;
                    // setState(() {
                    mapController = controller;
                    // });

                    // if (!_controller.isCompleted) {
                    //   _controller.complete(controller);
                    //   // _controller = await _controller.future;
                    // }
                    // mapController = await _controller.future;
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
                                ? Header(
                                    dragController: dragController,
                                    onCancel: () {
                                      dragController.animateTo(0.3,
                                          duration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          curve: Curves.easeInOut);
                                      destinationController.clear();
                                      ref
                                          .read(placesProvider.notifier)
                                          .update((state) => []);
                                    },
                                    onDone: () async {
                                      dragController.animateTo(0.3,
                                          duration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          curve: Curves.easeInOut);
                                      destinationController.clear();
                                      ref
                                          .read(placesProvider.notifier)
                                          .update((state) => []);

                                      final routePoliyline =
                                          await Repo.getRouteBetweenTwoPoints(
                                              start: LatLng(
                                                  locationState
                                                      .position!.latitude,
                                                  locationState
                                                      .position!.longitude),
                                              end: ref
                                                  .watch(destinationProvider)!,
                                              color: Colors.red);

                                      ref
                                          .read(
                                              routePolyPointsProvider.notifier)
                                          .update((state) => routePoliyline);
                                      // final controller =
                                      //     await _controller.future;
                                      final s = LatLng(
                                          locationState.position!.latitude,
                                          locationState.position!.longitude);
                                      final d = ref.watch(destinationProvider)!;
                                      await Repo
                                          .updateCameraLocationToZoomBetweenTwoMarkers(
                                              s, d, mapController);
                                    },
                                  )
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
                            ContenWidget(dragController, startController,
                                destinationController),
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
