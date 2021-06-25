import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:shreya_dere_project/app/app.logger.dart';
import 'package:shreya_dere_project/model/login/path_response.dart';
import 'package:shreya_dere_project/service/web_services/dashboard/path_list.dart';
import 'package:stacked/stacked.dart';

class DashBoardViewModel extends BaseViewModel {
  final log = getLogger('login');
  // final NavigationService _navigationService =
  //     locatorClass<NavigationService>();
  ScrollController horizontalListCtl = ScrollController();
  HomeService homeService = HomeService.create();
  BuiltList<PathResponse> _pathListResponse = BuiltList<PathResponse>();
  BuiltList<PathResponse> get pathListResponse => _pathListResponse;
  late int currentIndex;
  loadData(userName) async {
    log.d(userName);
    final Response<BuiltList<PathResponse>> response =
        await homeService.getAllPaths();
    if (response.statusCode == 200) {
      _pathListResponse = response.body as BuiltList<PathResponse>;
      notifyListeners();
    }
  }

  jumpTopToNextItem(index, i) {
    currentIndex = index;
    horizontalListCtl.jumpTo(i * 300.0);
  }
}
