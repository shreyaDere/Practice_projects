import 'package:shreya_dere_project/Ui/dashboard/dashboard_view.dart';
import 'package:shreya_dere_project/Ui/login/login_view.dart';
import 'package:shreya_dere_project/Ui/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: DashBoardView),
    MaterialRoute(page: LoginView),
  ],
  dependencies: [
    // Lazy singletons
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
    // LazySingleton(classType: ConnectivityService),

    // singletons
    // Singleton(classType: HistoryViewModel),
    // Singleton(classType: FavoritesViewModel),
  ],
  logger: StackedLogger(),
  locatorName: 'locatorClass',
  locatorSetupName: 'setupLocator',
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
