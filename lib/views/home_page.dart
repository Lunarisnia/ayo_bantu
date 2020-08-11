import 'package:android_intent/android_intent.dart';
import 'package:ayo_bantu/components/drawer/custom_drawer.dart';
import 'package:ayo_bantu/components/home_page/dash_board.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PermissionHandler permissionHandler = PermissionHandler();
  Map<PermissionGroup, PermissionStatus> permissions;
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              Navigator.of(context).pushReplacementNamed('/debug');
            },
          ),
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo-smaller.png',
            fit: BoxFit.cover,
            height: 60,
          ),
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
          bottom: TabBar(tabs: [
            Tab(icon: Icon(FontAwesomeIcons.bars, color: Colors.white)),
            Tab(icon: Icon(FontAwesomeIcons.home, color: Colors.white)),
            Tab(icon: Icon(FontAwesomeIcons.bell, color: Colors.white)),
            Tab(icon: Icon(Icons.restore, color: Colors.white)),
          ]),
        ),
        body: TabBarView(children: [
          CustomDrawer(),
          DashBoard(),
          Text('1'),
          Text('1'),
        ]),
      ),
    );
  }
}
