import 'package:childcare/manager/homecubit_cubit.dart';
import 'package:childcare/model/child_data_model.dart';
import 'package:childcare/model/mom_data_model.dart';
import 'package:childcare/observer.dart';
import 'package:childcare/routes/app_routes.dart';
import 'package:childcare/screens/add_mom.dart';
import 'package:childcare/screens/addchild.dart';
import 'package:childcare/screens/child_services.dart';
import 'package:childcare/screens/home_layout.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:childcare/screens/medisen.dart';
import 'package:childcare/screens/sleep_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String childBox = 'child';
const String momBox = 'mom';
void main() async {
  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();
  Hive.registerAdapter(ChildDataModelAdapter());
  await Hive.openBox<ChildDataModel>(childBox);
  await Hive.openBox<MomDataMode>(momBox);
  Hive.registerAdapter(MomDataModeAdapter());
  await ScreenUtil.ensureScreenSize();
  runApp(BlocProvider(
    create: (context) => HomeCubit(),
    child: const ChildCare(),
  ));
}

class ChildCare extends StatelessWidget {
  const ChildCare({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 736),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.homeLayout,
        locale: const Locale('ar'),
        routes: {
          AppRoutes.homeLayout: (context) => const HomeLayout(),
          AppRoutes.addChildPage: (context) => const AddChild(),
          AppRoutes.addMomPage: (context) => const AddMom(),
          AppRoutes.addChildServices: (context) => const ChildServices(),
          AppRoutes.medican: (context) => const Medisent(),
          AppRoutes.sleepPage: (context) => const SleepTime(),
        },
      ),
    );
  }
}
