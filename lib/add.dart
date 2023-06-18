import 'package:flutter/material.dart';

const List<String> list = <String>[
  'ЖКХ',
  'Здоровье',
  'Демография',
  'Транспорт'
];

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  double _currentSliderValue = 0;

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          margin: const EdgeInsets.only(
            top: 250,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: SizedBox()),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: SizedBox(
                              width: 36,
                              height: 4,
                              child: FittedBox(
                                  child: Container(
                                width: 36,
                                height: 4,
                                decoration: const BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                              ))))),
                  Expanded(
                      child: IconButton(
                          alignment: AlignmentDirectional.centerEnd,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close)))
                ],
              ),
              const Padding(
                  padding: EdgeInsets.all(20),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Что здесь? Добавьте свою оценку по категории',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: const Row(
                    children: [
                      Expanded(
                          child: Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: Text(
                                'Категория',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))),
                      Expanded(
                          child: Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: Text(
                                'Оценка',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )))
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Color(0xff8098FE)),
                        underline: Container(
                          height: 2,
                          color: const Color(0xff8098FE),
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                      Expanded(
                          child: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black12),
                        child: Text(_currentSliderValue.round().toString()),
                      ))
                    ],
                  )),
              const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Column(
                        children: [],
                      ),
                      Expanded(
                          child: Column(
                        children: [],
                      ))
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Slider(
                    activeColor: const Color(0xff8098FE),
                    divisions: 10,
                    value: _currentSliderValue,
                    max: 10,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  )),
              Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                      const Color(0xff8098FE),
                    )),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Применить'),
                  )),
            ],
          )),
    );
  }
}
