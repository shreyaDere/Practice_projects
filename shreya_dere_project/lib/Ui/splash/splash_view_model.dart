import 'package:shreya_dere_project/app/app.locator.dart';
import 'package:shreya_dere_project/app/app.logger.dart';
import 'package:shreya_dere_project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final log = getLogger('splash');
  final NavigationService _navigationService =
      locatorClass<NavigationService>();

  loadData() {
    Future.delayed(Duration(seconds: 5), () async {
      _navigationService.navigateTo(Routes.loginView);
    });
  }
}
