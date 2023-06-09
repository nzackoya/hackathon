import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hack/filter.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math' as math;

import 'map_zoom_buttons.dart';

const List<String> list = <String>[
  'Все',
  'ЖКХ',
  'Здоровье',
  'Демография',
  'Транспорт'
];

class HomeComfort extends StatefulWidget {
  const HomeComfort({Key? key}) : super(key: key);

  @override
  _HomeComfortState createState() => _HomeComfortState();
}

class _HomeComfortState extends State<HomeComfort> {
  Map<LatLng, Color> pointsData = {};
  bool isSatellite = false;

  String dropdownValue = list.first;

  @override
  void initState() {
    generatePointsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: FlutterMap(
          options: MapOptions(
            interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
            center: LatLng(45.036349, 38.974551),
            zoom: 10,
          ),
          nonRotatedChildren: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isSatellite = !isSatellite;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: TileLayer(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/mapbox/{styleId}/tiles/512/{z}/{x}/{y}@2x?access_token={accessToken}",
                    additionalOptions: {
                      "accessToken":
                          "pk.eyJ1Ijoibnpha295YSIsImEiOiJjbGl6dHRzaWQwcTFvM2lxcXJ5dWJ4a212In0.VxYqYQWT0bAVKk2TVGtJAQ",
                      "styleId": isSatellite ? "streets-v12" : "satellite-v9"
                    },
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      mini: true,
                      backgroundColor: Colors.white,
                      onPressed: () async {
                        await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return const Filter();
                            });
                        setState(() {});
                      },
                      child: const Icon(Icons.filter_list_outlined),
                    ))),
            const Positioned(
                right: 12,
                top: 70,
                child: FlutterMapZoomButtons(
                  maxZoom: 12.5,
                  zoomInColor: Colors.white,
                  zoomOutColor: Colors.white,
                  zoomOutIcon: Icons.remove,
                  zoomInIcon: Icons.add,
                  padding: 0,
                  mini: true,
                  alignment: Alignment.topRight,
                )),
          ],
          children: [
            TileLayer(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/mapbox/{styleId}/tiles/512/{z}/{x}/{y}@2x?access_token={accessToken}",
              additionalOptions: {
                "accessToken":
                    "pk.eyJ1Ijoibnpha295YSIsImEiOiJjbGl6dHRzaWQwcTFvM2lxcXJ5dWJ4a212In0.VxYqYQWT0bAVKk2TVGtJAQ",
                "styleId": isSatellite ? "satellite-v9" : "streets-v12"
              },
            ),
            MarkerLayer(
                markers: pointsData.entries
                    .map((entry) => Marker(
                          point: getRandomLocation(entry.key, 5000),
                          width: 30,
                          height: 30,
                          builder: (context) => Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: entry.value),
                          ),
                        ))
                    .toList())
          ],
        ))
      ],
    ));
  }

  LatLng getRandomLocation(LatLng point, int radius) {
    //This is to generate 10 random points
    double x0 = point.latitude;
    double y0 = point.longitude;

    math.Random random = math.Random();

    // Convert radius from meters to degrees
    double radiusInDegrees = radius / 111000;

    double u = random.nextDouble();
    double v = random.nextDouble();
    double w = radiusInDegrees * math.sqrt(u);
    double t = 2 * pi * v;
    double x = w * math.cos(t);
    double y = w * math.sin(t) * 1.75;

    // Adjust the x-coordinate for the shrinking of the east-west distances
    double new_x = x / math.sin(y0);

    double foundLatitude = new_x + x0;
    double foundLongitude = y + y0;
    LatLng randomLatLng = LatLng(foundLatitude, foundLongitude);

    return randomLatLng;
  }

  generatePointsData() {
    pointsData = {
      for (var index in List.generate(100, (index) => index))
        getRandomLocation(LatLng(45.036349, 38.974551), 5000): Color.fromRGBO(
            math.Random().nextInt(255), math.Random().nextInt(255), 0, 0.5)
    };
    if (mounted) {
      setState(() {});
    }
  }
}
