import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:shreya_dere_project/app/app.logger.dart';
import 'package:shreya_dere_project/model/login/path_response.dart';
import 'package:shreya_dere_project/service/web_services/dashboard/path_list.dart';
import 'package:stacked/stacked.dart';

class DashBoardViewModel extends BaseViewModel {
  final log = getLogger('login');
  ScrollController horizontalListCtl = ScrollController();
  HomeService homeService = HomeService.create();
  BuiltList<PathResponse> _pathListResponse = BuiltList<PathResponse>();
  BuiltList<PathResponse> get pathListResponse => _pathListResponse;
  late int currentIndex;
  late String userName = "";
  bool _showAlert = true;
  bool get showAlert => _showAlert;

  loadData(userName) async {
    log.d(userName);
    userName = userName;
    final Response<BuiltList<PathResponse>> response =
        await homeService.getAllPaths();
    if (response.statusCode == 200) {
      _pathListResponse = response.body as BuiltList<PathResponse>;
    }
    notifyListeners();
  }

  getUserNamer() {
    return userName;
  }

  jumpTopToNextItem(index, i) {
    currentIndex = index;
    horizontalListCtl.animateTo(i * 400.0,
        duration: Duration(microseconds: 1000), curve: Curves.bounceInOut);
  }

  dismissAlert() {
    _showAlert = false;
    notifyListeners();
  }
}
