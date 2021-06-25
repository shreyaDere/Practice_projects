import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shreya_dere_project/app/app.locator.dart';
import 'package:shreya_dere_project/app/app.router.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator(environment: Environment.dev);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stacked Architecture Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: [StackedService.routeObserver],
      navigatorKey: StackedService.navigatorKey,
      initialRoute: Routes.splashView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
