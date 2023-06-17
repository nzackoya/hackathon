import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
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
              const SizedBox(
                width: 200,
                height: 75,
                child: TextField(
                  decoration: InputDecoration(hintText: "Логин"),
                ),
              ),
              const SizedBox(
                width: 200,
                height: 75,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Пароль"),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all(Colors.deepPurpleAccent)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Войти'),
              ),
            ],
          )),
    );
  }
}
