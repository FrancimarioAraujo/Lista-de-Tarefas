import 'package:click/app/modules/routine/controller/routine_controller.dart';
import 'package:click/app/modules/routine/view/components/new_routine_alert_dialog.dart';
import 'package:click/app/modules/routine/view/pages/routine_concluded_body_page.dart';
import 'package:click/app/modules/routine/view/pages/routine_peding_body_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({Key? key}) : super(key: key);

  @override
  _RoutinePageState createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  final routinesController = Modular.get<RoutineController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("tasks".i18n()),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Pendentes",
                icon: Icon(Icons.pending_actions_rounded),
              ),
              Tab(
                text: "Concluidas",
                icon: Icon(Icons.check),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RoutinePedingBodyPage(),
            RoutineConcludedBodyPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "addNewRoutine",
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => NewRoutineAlertDialog(),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
