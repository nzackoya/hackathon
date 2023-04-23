import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init/network/services_view.dart';
import 'package:init/style/init_style.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Contractors extends ConsumerStatefulWidget {
  const Contractors({Key? key}) : super(key: key);

  @override
  _ContractorsState createState() => _ContractorsState();
}

class _ContractorsState extends ConsumerState<Contractors> {

  List<int> selected = [];

  @override
  Widget build(BuildContext context) {
    final services = ref.watch(servicesProvider).value;
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            if (services != null) {
              _showMultiSelect(context, services);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  selected.isEmpty ? 'Фильтр по услугам' : 'Выбрано услуг: ${selected.length}',
                  style: InitStyle.textMedium16Neutral500.copyWith(color: Colors.white, decoration: TextDecoration.underline)
              ),
              const Icon(Icons.filter_list)
            ],
          )
        ),
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 150,
            child: Card(
              elevation: 8,
              child: Padding(padding: EdgeInsets.all(10), child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Подрядчик ${index + 1}",  textAlign: TextAlign.center, style: InitStyle.textSemiBold20Neutral1000,),
                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 80, width: 80, child: Image.asset("assets/contractors/${index + 1}.png")),
                      SizedBox(width: 10,),
                      Expanded(child: Text("Подрядчик ${index + 1}, Современные технологии достигли такого уровня, что глубокий уровень погружения предоставляет широкие возможности для системы обучения кадров, соответствующей насущным потребностям. Кстати, действия представителей оппозиции превращены в посмешище, хотя само их существование приносит несомненную пользу обществу! Господа, базовый вектор развития представляет собой интересный эксперимент проверки системы массового участия.",
                        textAlign: TextAlign.left,
                        style: InitStyle.textMedium12Neutral500,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                      ))
                    ],
                  ),
                ],
              )),
            )
          );
        },
        separatorBuilder: (context, index) {

          return const SizedBox(height: 10,);
        },
      ),
    );
  }

  void _showMultiSelect(BuildContext context, Map<int, String> services) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return  MultiSelectDialog<int>(
          items: services.entries.map((e) => MultiSelectItem(e.key, e.value)).toList(),
          initialValue: selected,
          onConfirm: (values) {
            selected = values;
            setState(() {});
            // ref.read(profileProviderProvider.notifier).updateUser(data);
          },
        );
      },
    );
  }
}
