import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../style/init_style.dart';

class Projects extends ConsumerStatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends ConsumerState<Projects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Проекты', style: InitStyle.textSemiBold20Neutral1000.copyWith(color: Colors.white),),
        actions: [
          IconButton(onPressed: () {

          }, icon: const Icon(Icons.add, color: Colors.white))
        ],
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
                  children: [
                    Text("Проект ${index + 1}",  textAlign: TextAlign.center, style: InitStyle.textSemiBold20Neutral1000,),
                    Row(
                      children: [
                        SizedBox(height: 90, width: 90, child: Image.asset("assets/projects/${index + 1}.png")),
                        Expanded(child: Text("Проект ${index + 1}, Современные технологии достигли такого уровня, что глубокий уровень погружения предоставляет широкие возможности для системы обучения кадров, соответствующей насущным потребностям. Кстати, действия представителей оппозиции превращены в посмешище, хотя само их существование приносит несомненную пользу обществу! Господа, базовый вектор развития представляет собой интересный эксперимент проверки системы массового участия.",
                          textAlign: TextAlign.left,
                          style: InitStyle.textMedium12Neutral500,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
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
}
