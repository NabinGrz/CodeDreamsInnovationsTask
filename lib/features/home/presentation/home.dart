import 'package:core_dreams_innovations/core/constants/app_colors.dart';
import 'package:core_dreams_innovations/core/constants/app_styles.dart';
import 'package:core_dreams_innovations/core/constants/text_styles.dart';
import 'package:core_dreams_innovations/features/home/domain/entities/place_latlng_model.dart';
import 'package:core_dreams_innovations/features/home/presentation/provider/latlng_provider.dart';
import 'package:core_dreams_innovations/features/home/presentation/provider/location_provider.dart';
import 'package:core_dreams_innovations/features/home/presentation/provider/place_provider.dart';
import 'package:core_dreams_innovations/features/home/presentation/provider/select_place_provider.dart';
import 'package:core_dreams_innovations/features/home/widget/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/header.dart';
import 'provider/search_place_provider.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  GoogleMapController? mapController;
  final dragController = DraggableScrollableController();
  final startController = TextEditingController();
  final destinationController = TextEditingController();
  PlaceLatLngModel? get destinationModel => ref.watch(selectPlaceProvider);
  Polyline? get routePolyLines => ref.watch(routesProvider);
  GoogleMapAPINotifier get googleApiNotifier =>
      ref.read(googleApiProvider.notifier);
  LatLngNotifier get latlngNotifier => ref.read(latlngProvider.notifier);
  SearchPlaceNotifier get searchPlaceNotifier =>
      ref.read(searchPlaceProvider.notifier);
  bool get isExpanded => ref.watch(isExpandedProvider);
  void listenToLocationProvider() {
    ref.listen(locationProvider.select((value) => value),
        (previous, next) async {
      if (next.position != null) {
        mapController?.animateCamera(
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

        await latlngNotifier.latlngToPlace(
            "${next.position!.latitude},${next.position!.longitude}");
        final address = ref.watch(latlngProvider);
        startController.text = address?.formatted_address ?? "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    listenToLocationProvider();
    final locationState = ref.watch(locationProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: AppColors.primary,
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      // extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          GoogleMap(
            style: ref.watch(mapStyleProvider).value,
            myLocationButtonEnabled: false,
            myLocationEnabled: false,
            zoomControlsEnabled: false,
            polylines: {
              if (routePolyLines != null) ...{routePolyLines!}
            },
            markers: {
              if (destinationModel?.latLng != null) ...{
                Marker(
                    icon: ref.watch(destinationIconProvider).valueOrNull ??
                        BitmapDescriptor.defaultMarker,
                    markerId: const MarkerId("1"),
                    infoWindow: InfoWindow(
                        title: destinationModel?.description.description ?? ""),
                    position: destinationModel!.latLng)
              },
              if (locationState.position != null) ...{
                Marker(
                    icon: ref.watch(startIconProvider).valueOrNull ??
                        BitmapDescriptor.defaultMarker,
                    markerId: const MarkerId("2"),
                    infoWindow: InfoWindow(title: startController.text),
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
              mapController = controller;
              await ref
                  .read(locationProvider.notifier)
                  .checkLocationPermission(context);
            },
          ),
          NotificationListener<DraggableScrollableNotification>(
            onNotification: (DraggableScrollableNotification dSNotification) {
              ref
                  .read(isExpandedProvider.notifier)
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
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: isExpanded
                        ? null
                        : BorderRadius.only(
                            topLeft: Radius.circular(25.r),
                            topRight: Radius.circular(25.r),
                          ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
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
                      (isExpanded)
                          ? Header(
                              dragController: dragController,
                              onCancel: () {
                                dragController.animateTo(0.3,
                                    duration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    curve: Curves.easeInOut);
                                destinationController.clear();
                                searchPlaceNotifier.clearSuggestions();
                              },
                              onDone: () async {
                                await googleApiNotifier.onDone(
                                    ref,
                                    dragController,
                                    destinationController,
                                    locationState,
                                    mapController,
                                    destinationModel);
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
                      SliverPadding(padding: EdgeInsets.all(6.h)),
                      ContenWidget(dragController, startController,
                          destinationController),
                    ],
                  ),
                );
              },
            ),
          ),
          if (!isExpanded) ...{
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            )
          }
        ],
      ),
    );
  }
}
