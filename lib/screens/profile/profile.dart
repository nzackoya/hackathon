import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init/model/user.dart';
import 'package:init/network/services_view.dart';
import 'package:init/screens/login/login_view.dart';
import 'package:init/screens/profile/profile_view.dart';
import 'package:init/style/init_style.dart';
import 'package:init/util/extension.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {

  @override
  Widget build(BuildContext context) {
    final services = ref.watch(servicesProvider).value;
    final user = ref.watch(profileProviderProvider);
    return user.handle(
      data: (data) {
        if (data == null) {
            return const Center(child: Text('Ой, что-то пошло не так'));
          } else {
          return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const Profile()));
                  }, icon: Icon(Icons.add_chart, color: Colors.white,)),
                  IconButton(onPressed: () {
                    ref.read(profileProviderProvider.notifier).updateUser(data);
                  }, icon: Icon(Icons.save, color: Colors.white))
                ],
              ),
              body: Center(child:
              SingleChildScrollView(child:
        Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Column(
                children: [
                  Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: TextFormField(
                    maxLines: 1,
                    initialValue: data.name,
                    cursorColor: Colors.black54,
                    style: InitStyle.textMedium16Neutral1000,
                    decoration: const InputDecoration(
                        contentPadding:
                        EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
                        isDense: true,
                        floatingLabelStyle: InitStyle.textMedium12Neutral500,
                        hintStyle: InitStyle.textMedium16Neutral500,
                        border: InputBorder.none,
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusColor: Colors.black26,
                        labelText: "Название"),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      data.name = value;
                      setState(() {});
                    },
                  )),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: TextFormField(
                    maxLines: 7,
                    initialValue: data.description,
                    cursorColor: Colors.black54,
                    style: InitStyle.textMedium16Neutral1000,
                    decoration: const InputDecoration(
                        contentPadding:
                        EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
                        isDense: true,
                        floatingLabelStyle: InitStyle.textMedium12Neutral500,
                        hintStyle: InitStyle.textMedium16Neutral500,
                        border: InputBorder.none,
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26)),
                        focusColor: Colors.black26,
                        labelText: "Описание"),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      data.description = value;
                      setState(() {});
                    },
                  )),
                  if (services != null && data.type == 'contractor') SizedBox(
                    height: 250,
                    child: Padding(padding: const EdgeInsets.symmetric(vertical: 20), child: Column(
                      children: [
                        const Align(alignment: Alignment.centerLeft, child: Text('Услуги', style: InitStyle.textMedium16Neutral500,)),
                        Expanded(child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black38),
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Card(
                                    child: Padding(padding: const EdgeInsets.all(10), child: Text(data.services!.entries.toList()[index].value, style: InitStyle.textMedium16Neutral500,)));
                              },
                              itemCount: data.services?.entries.length ?? 0
                          ),
                        ))
                      ],
                    ))
                  ),
                  if (services != null && data.type == 'contractor')
                    InitStyle.getButton("Добавить", () {
                      _showMultiSelect(context, data, services);
                    }),
                    const SizedBox(height: 40,),
                    InitStyle.getButton("Выйти", () {
                    ref.read(loginProviderProvider.notifier).logOut();
                  }, isActive: false)
                ],
              )),
              )));
        }
      }
    );
  }

  void _showMultiSelect(BuildContext context, User data, Map<int, String> services) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return  MultiSelectDialog<int>(
          items: services.entries.map((e) => MultiSelectItem(e.key, e.value)).toList(),
          initialValue: data.services?.keys.toList() ?? [],
          onConfirm: (values) {
            data.services = Map.fromEntries(services.entries.where((element) => values.contains(element.key)));
            ref.read(profileProviderProvider.notifier).updateUser(data);
          },
        );
      },
    );
  }
}
