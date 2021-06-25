import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:shreya_dere_project/app/app.locator.dart';
import 'package:shreya_dere_project/app/app.logger.dart';
import 'package:shreya_dere_project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final log = getLogger('login');
  final NavigationService _navigationService =
      locatorClass<NavigationService>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  late var _user;

  loadData() {}

  handleLogin() async {
    FacebookLoginResult _result = await _facebookLogin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    switch (_result.status) {
      case FacebookLoginStatus.cancel:
        log.d("Canceled by user");
        break;
      case FacebookLoginStatus.error:
        log.d(_result.error);
        break;
      case FacebookLoginStatus.success:
        // Get email (since we request email permission)
        // final email = await _facebookLogin.getUserEmail();
        // Send access token to server for validation and auth
        final FacebookAccessToken? accessToken = _result.accessToken;
        // Get profile data
        final profile = await _facebookLogin.getUserProfile();
        // Get user profile image url
        final imageUrl = await _facebookLogin.getProfileImageUrl(width: 100);
        log.d(
            'Access token: ${accessToken!.token} Hello, ${profile!.name}! You ID: ${profile.userId} Your profile image: $imageUrl');
        dashBoardLogin(profile.name);
        break;
      default:
    }
  }

  dashBoardLogin(name) {
    _navigationService.navigateTo(Routes.dashBoardView,
        arguments: DashBoardViewArguments(name: name));
  }
}
