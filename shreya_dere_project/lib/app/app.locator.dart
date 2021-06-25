// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

final locatorClass = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locatorClass.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locatorClass.registerLazySingleton(() => DialogService());
  locatorClass.registerLazySingleton(() => BottomSheetService());
  locatorClass.registerLazySingleton(() => NavigationService());
}
