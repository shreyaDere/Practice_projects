import 'package:flutter/material.dart';
import 'package:shreya_dere_project/Ui/splash/splash_view_model.dart';
import 'package:shreya_dere_project/constants/color/color.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) =>
          Scaffold(body: SafeArea(top: true, child: SplashWidget())),
    );
  }
}

class SplashWidget extends ViewModelWidget<SplashViewModel> {
  @override
  Widget build(BuildContext context, SplashViewModel viewModel) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: BACKGROUND_COLOR,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/gif/image.gif",
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.height / 5,
          ),
          Text(
            "Dog's Path",
            style: TextStyle(
                fontSize: 30,
                color: TEXT_COLOR, //Colors.white54,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "by",
            style: TextStyle(fontSize: 10, color: TEXT_COLOR),
          ),
          SizedBox(height: 10),
          Text(
            "VirtouStack Softwares Pvt. Ltd",
            style: TextStyle(fontSize: 18, color: TEXT_COLOR),
          ),
        ],
      ),
    );
  }
}
