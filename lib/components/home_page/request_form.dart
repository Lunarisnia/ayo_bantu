import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestForm extends StatefulWidget {
  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  File _selected;
  Position _currentPosition;
  String _currentAddress;

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
    _gpsService();
  }

  Future<bool> _requestPermission(PermissionGroup permission) async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    var result = await _permissionHandler.requestPermissions([permission]);
    if (result[permission] == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

/*Checking if your App has been Given Permission*/
  Future<bool> requestLocationPermission({Function onPermissionDenied}) async {
    var granted = await _requestPermission(PermissionGroup.location);
    if (granted != true) {
      requestLocationPermission();
    }
    debugPrint('requestLocationPermission $granted');
    return granted;
  }

/*Show dialog if GPS not enabled and open settings location*/
  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Tidak dapat menerima lokasi saat ini"),
                content:
                    const Text('Pastikan aktifkan GPS dan coba lagi'),
                actions: <Widget>[
                  FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        final AndroidIntent intent = AndroidIntent(
                            action:
                                'android.settings.LOCATION_SOURCE_SETTINGS');
                        intent.launch();
                        Navigator.of(context, rootNavigator: true).pop();
                        _gpsService();
                      })
                ],
              );
            });
      }
    }
  }

/*Check if gps service is enabled or not*/
  Future _gpsService() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      _checkGps();
      return null;
    } else
      return true;
  }

  BoxDecoration get _image {
    return _selected == null
        ? BoxDecoration(color: Colors.grey[300])
        : BoxDecoration(
            image:
                DecorationImage(image: FileImage(_selected), fit: BoxFit.cover),
          );
  }


  _getCurrentLocation() async{
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }


  _getAddressFromLatLng() async {
    try {
      GeolocationStatus geolocationStatus  = await geolocator.checkGeolocationPermissionStatus();
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        print(geolocationStatus);
        _currentAddress =
            "${place.name}, ${place.thoroughfare}, ${place.postalCode}";
            
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 28,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Request Makanan'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: <Color>[
                  Color.fromRGBO(85, 190, 186, 1),
                  Color.fromRGBO(218, 235, 199, 1)
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('POST'),
              onPressed: () {
                print('Request posted');
              },
            )
          ],
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/blank-profile.png'),
                  ),
                ),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
                right: 18.0,
                bottom: 10.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(49, 82, 91, 1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 150.0,
                    ),
                    child: Container(
                      decoration: _image,
                    ),
                  ),
                  _selected == null ? Text('Select an image') : Container(),
                  Positioned(
                    right: 8.0,
                    bottom: 8.0,
                    child: FloatingActionButton(
                      backgroundColor: Colors.cyan[300],
                      child: Icon(
                        Icons.photo_library,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        final PickedFile image = await ImagePicker()
                            .getImage(source: ImageSource.gallery);
                        setState(() {
                          _selected = File(image.path);
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 10.0,
              ),
              child: TextFormField(
                maxLines: 2,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(30),
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(49, 82, 91, 1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 10.0,
              ),
              child: TextFormField(
                maxLines: 2,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(30),
                  labelText: 'Address',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(49, 82, 91, 1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: RaisedButton(
                child: Text('Your location'),
                onPressed: () {
                  print(_currentAddress);
                  _getCurrentLocation();
                },
              ),
            ),
            if (_currentPosition != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AutoSizeText(
                    _currentAddress,
                    maxFontSize: 18,
                    minFontSize: 13,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
