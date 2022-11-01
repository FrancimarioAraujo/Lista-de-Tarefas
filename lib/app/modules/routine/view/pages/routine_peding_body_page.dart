import 'package:click/app/modules/routine/controller/routine_controller.dart';
import 'package:click/app/modules/routine/view/components/card_routine.dart';
import 'package:click/assets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';

class RoutinePedingBodyPage extends StatefulWidget {
  const RoutinePedingBodyPage({Key? key}) : super(key: key);

  @override
  State<RoutinePedingBodyPage> createState() => _RoutinePedingBodyPageState();
}

class _RoutinePedingBodyPageState extends State<RoutinePedingBodyPage> {
  final routinesController = Modular.get<RoutineController>();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routinesController.fetchRoutines();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColor = Theme.of(context).colorScheme;

    ScreenUtil.init(context,
        designSize: const Size(
            Constants.WIDTH_DEVICE_DEFAULT, Constants.HEIGHT_DEVICE_DEFAULT));

    return Observer(
      builder: (_) {
        if (routinesController.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: themeColor.secondary,
            ),
          );
        }
        if (routinesController.routinesPending.isEmpty) {
          return Center(
            child: Text(
              "thereAreNoTasks".i18n(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
          );
        }

        return Observer(builder: (_) {
          return ListView.builder(
            itemCount: routinesController.routinesPending.length,
            itemBuilder: (context, index) {
              return CardRoutine(routinesController.routinesPending[index]);
            },
          );
        });
      },
    );
  }
}
