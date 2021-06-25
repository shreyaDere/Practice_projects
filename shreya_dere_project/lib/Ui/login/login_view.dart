import 'package:flutter/material.dart';
import 'package:shreya_dere_project/Ui/login/login_view_model.dart';
import 'package:shreya_dere_project/constants/color/color.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) =>
          Scaffold(body: SafeArea(top: true, child: LoginWidget())),
    );
  }
}

class LoginWidget extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, viewModel) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: BACKGROUND_COLOR,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign In",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 22),
          Text(
            "Sign in with your facebook account",
            style: TextStyle(
                fontSize: 14, letterSpacing: 0.3, color: Colors.white),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () => viewModel.handleLogin(),
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              height: 40,
              color: Color(0xFF3B5998), //FF3B5998
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/facebook.png",
                    height: 30,
                    width: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sign in with Facebook",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
