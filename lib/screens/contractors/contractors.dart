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
          ),
        ),
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
