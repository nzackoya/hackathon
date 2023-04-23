import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init/screens/login/login_view.dart';
import 'package:init/style/init_style.dart';
import 'package:init/util/hive_helper.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginPage> {

  String username = '';
  String password = '';
  String type = 'contractor';

  bool isLogin = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Padding(padding: const EdgeInsets.symmetric(horizontal:20), child: Center(child:
      SingleChildScrollView(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            maxLines: 1,
            initialValue: username,
            cursorColor: Colors.black54,
            style: InitStyle.textMedium16Neutral1000,
            decoration: const InputDecoration(
                contentPadding:
                EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
                isDense: true,
                floatingLabelStyle: InitStyle.textMedium12Neutral500,
                hintStyle: InitStyle.textMedium16Neutral500,
                border: InputBorder.none,
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                focusColor: Colors.black26,
                filled: true,
                fillColor: Colors.black12,
                labelText: "Имя пользователья"),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              username = value.trim();
              setState(() {});
            },
          ),
          const SizedBox(height: 10,),
          TextFormField(
            maxLines: 1,
            initialValue: password,
            cursorColor: Colors.black54,
            style: InitStyle.textMedium16Neutral1000,
            decoration: const InputDecoration(
                contentPadding:
                EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
                isDense: true,
                floatingLabelStyle: InitStyle.textMedium12Neutral500,
                hintStyle: InitStyle.textMedium16Neutral500,
                border: InputBorder.none,
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                focusColor: Colors.black26,
                filled: true,
                fillColor: Colors.black12,
                labelText: "Пароль"),
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            onChanged: (value) {
              password = value.trim();
              setState(() {});
            },
          ),
          const SizedBox(height: 20,),
          if (!isLogin) Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Подрядчик'),
              Switch(
                  value: type != 'contractor',
                  activeColor: Colors.red,
                  inactiveThumbColor: Colors.blue,
                  inactiveTrackColor: Colors.lightBlueAccent,
                  onChanged: (value) {
                    type = value ? 'organisation' : 'contractor';
                    setState(() {});
                  }),
              Text('Организация'),
            ],
          ),
          const SizedBox(height: 20,),
          InitStyle.getButton(isLogin ? "Логин" : "Регистрация", () async {
            if (isLogin) {
              await ref.read(loginProviderProvider.notifier).login(username, password);
            } else {
              await ref.read(loginProviderProvider.notifier).auth(username, password, type);
            }
          }),
          const SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              isLogin = !isLogin;
              setState(() {});
            },
            child: Text(isLogin ? "Нет профиля?" : "Уже есть профиль?", textAlign: TextAlign.center,
              style: InitStyle.textMedium16Neutral1000.copyWith(color: Colors.black38),),
          )
        ],
      ))))
    );
  }
}
