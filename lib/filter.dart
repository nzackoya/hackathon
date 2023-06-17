import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  double schoolValue = 0;
  double kinderValue = 0;
  double hospitalValue = 0;
  double parkValue = 0;
  double mallValue = 0;
  double marketValue = 0;
  double transportValue = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          margin: const EdgeInsets.only(
            top: 100,
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
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Фильтрация',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        'Доступность школ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black12),
                        child: Text(schoolValue.round().toString()),
                      ),
                      Expanded(
                          child: Slider(
                        divisions: 100,
                        value: schoolValue,
                        max: 100,
                        label: schoolValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            schoolValue = value;
                          });
                        },
                      ))
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        'Доступность детских садов',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black12),
                        child: Text(kinderValue.round().toString()),
                      ),
                      Expanded(
                          child: Slider(
                        divisions: 100,
                        value: kinderValue,
                        max: 100,
                        label: kinderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            kinderValue = value;
                          });
                        },
                      ))
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        'Доступность поликлиник',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black12),
                        child: Text(hospitalValue.round().toString()),
                      ),
                      Expanded(
                          child: Slider(
                        divisions: 100,
                        value: hospitalValue,
                        max: 100,
                        label: hospitalValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            hospitalValue = value;
                          });
                        },
                      ))
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        'Доступность парков',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black12),
                        child: Text(parkValue.round().toString()),
                      ),
                      Expanded(
                          child: Slider(
                        divisions: 100,
                        value: parkValue,
                        max: 100,
                        label: parkValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            parkValue = value;
                          });
                        },
                      ))
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        'Доступность торговых центров',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black12),
                        child: Text(mallValue.round().toString()),
                      ),
                      Expanded(
                          child: Slider(
                        divisions: 100,
                        value: mallValue,
                        max: 100,
                        label: mallValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            mallValue = value;
                          });
                        },
                      ))
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        'Доступность продуктовых магазинов',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black12),
                        child: Text(marketValue.round().toString()),
                      ),
                      Expanded(
                          child: Slider(
                        divisions: 100,
                        value: marketValue,
                        max: 100,
                        label: marketValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            marketValue = value;
                          });
                        },
                      ))
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        'Доступность остановок общественного транспорта',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black12),
                        child: Text(transportValue.round().toString()),
                      ),
                      Expanded(
                          child: Slider(
                        divisions: 100,
                        value: transportValue,
                        max: 100,
                        label: transportValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            transportValue = value;
                          });
                        },
                      ))
                    ],
                  )
                ],
              ))),
              Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.deepPurpleAccent)),
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
