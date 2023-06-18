import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Все',
  'ЖКХ',
  'Здоровье',
  'Демография',
  'Транспорт'
];

class Home3D extends StatefulWidget {
  const Home3D({Key? key}) : super(key: key);

  @override
  _Home3DState createState() => _Home3DState();
}

class _Home3DState extends State<Home3D> {
  int _currentSliderValue = 2023;

  // Map<double, String> data =

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Image.asset(
          'assets/images/${getImage()}.jpeg',
          fit: BoxFit.fitHeight,
        )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              const Text('2023'),
              Expanded(
                  child: Slider(
                activeColor: Color(0xff8098FE),
                divisions: 6,
                value: _currentSliderValue.toDouble(),
                min: 2023,
                max: 2050,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value.round();
                  });
                },
              )),
              const Text('2050')
            ]))
      ],
    ));
  }

  int getImage() {
    if (_currentSliderValue == 2050) {
      return 7;
    } else if (_currentSliderValue == 2046) {
      return 6;
    } else if (_currentSliderValue == 2041) {
      return 5;
    } else if (_currentSliderValue == 2037) {
      return 4;
    } else if (_currentSliderValue == 2032) {
      return 3;
    } else if (_currentSliderValue == 2028) {
      return 2;
    } else {
      return 1;
    }
  }
}
