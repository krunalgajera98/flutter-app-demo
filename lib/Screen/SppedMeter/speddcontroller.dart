import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

class SpeedController extends GetxController {
  // Rx<Timer>? timer;
  Rx<StreamController<double>> velocityController = StreamController<double>().obs;
  Rx<GeolocatorPlatform> locator = GeolocatorPlatform.instance.obs;
  RxDouble velocity = 0.0.obs;
  RxDouble velocity1 = 0.0.obs;
  RxDouble highestVelocity = 0.0.obs;
  late StreamSubscription<Position> positionStream;
  Rx<StreamController<double>> streamController = StreamController<double>().obs;
  late Stream stream = streamController.stream;
  Timer? timer;
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    // _onAccelerate();
    getLocationPermission();
  }

  void _onAccelerate() {
    print('_onAccelerate ===>');
    locator.value
        .getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.lowest,
        timeLimit: Duration(milliseconds: 200),
      ),
    )
        .listen(
      (Position position) {
        velocity.value = (position.speed * (3.6));
        velocityController.value.add(velocity.value);
        // _onAccelerate(position.speed);
      },
    );
  }

  getLocationPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }
      // bool val = await Permission.location.serviceStatus.isEnabled;
      bool val = await Geolocator.isLocationServiceEnabled();
      print('Geolocator.isLocationServiceEnabled(): $val');
      if (val == false) {
        // Geolocator.requestPermission();
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      }
      if (val) {
        onShareFacebook();
      }
    } on Exception catch (e) {
      print('Geolocator.requestPermission Exception: $e');
    }
  }

  getLoc() async {
    bool _serviceEnabled;
    loc.PermissionStatus _permissionGranted;
    loc.Location location = loc.Location();

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }

    // location.onLocationChanged.listen((loc.LocationData currentLocation) {
    //   print("longitude/longitude ===> ${currentLocation.latitude} : ${currentLocation.longitude}");
    // });
  }

  void onShareFacebook() async {
    /// Stream
    // stream.listen((double) {
    //   print('getCurrentPosition latitude: ');
    // });

    /// Timer
    try {

        Geolocator.getPositionStream().listen((Position position) {
          print('Geolocator.getPositionStream()');
          velocity.value = position.speed;
          streamController.value.sink.add(position.speed);
        });


      timer = Timer.periodic(const Duration(milliseconds: 400), (timer) async {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation);
        velocity1.value = position.speed;
        // streamController.value.sink.add(position.speed);
      });
    } on Exception catch (e) {
      print('timer Exception: $e');
    }
  }
}
