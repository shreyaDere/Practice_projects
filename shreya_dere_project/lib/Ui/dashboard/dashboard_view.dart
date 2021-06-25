import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shreya_dere_project/Ui/dashboard/dashboard_view_model.dart';
import 'package:shreya_dere_project/constants/color/color.dart';
import 'package:stacked/stacked.dart';

class DashBoardView extends StatelessWidget {
  String name;
  DashBoardView({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashBoardViewModel>.reactive(
      viewModelBuilder: () => DashBoardViewModel(),
      onModelReady: (model) => model.loadData(name),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            leading: Container(),
            backgroundColor: BACKGROUND_COLOR,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Dog's Path",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, //Colors.white54,
              ),
            ),
          ),
          body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  model.isBusy
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.white.withOpacity(0.2),
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  new AlwaysStoppedAnimation<Color>(Colors.red),
                              strokeWidth: 5,
                            ),
                          ),
                        )
                      : DashBoardWidgetList(),
                  model.showAlert ? ShowAlert(name) : Container()
                ],
              ))),
    );
  }
}

/*
CupertinoAlertDialog(
                          title: new Text("Alert"),
                          content: new Text("Sign in as ${model.userName}"),
                          actions: <Widget>[
                            CupertinoDialogAction(
                                onPressed: () => model.dismissAlert(),
                                child: Text("Ok")),
                          ],
                        )
*/
class ShowAlert extends ViewModelWidget<DashBoardViewModel> {
  String name;
  ShowAlert(this.name);
  @override
  Widget build(BuildContext context, DashBoardViewModel viewModel) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.6,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              "Alert",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Sign in as $name",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey,
              height: 0.2,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => viewModel.dismissAlert(),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.6,
                child: Text(
                  "ok",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class DashBoardWidgetList extends ViewModelWidget<DashBoardViewModel> {
  @override
  Widget build(BuildContext context, DashBoardViewModel viewModel) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: BACKGROUND_COLOR,
      child: ListView.builder(
          itemCount: viewModel.pathListResponse.length,
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${viewModel.pathListResponse[index].id} ${viewModel.pathListResponse[index].title == null ? "" : viewModel.pathListResponse[index].title}",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${viewModel.pathListResponse[index].subPaths.length} sub path",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.black,
                        padding: EdgeInsets.only(
                            top: 8, bottom: 8, left: 10, right: 10),
                        child: Text(
                          "open path",
                          style: TextStyle(color: Colors.blue[100]),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4 + 60,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: ListView.builder(
                      controller: viewModel.horizontalListCtl,
                      itemCount:
                          viewModel.pathListResponse[index].subPaths.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 4,
                                child: CachedNetworkImage(
                                    errorWidget: (context, url, error) =>
                                        Container(child: Icon(Icons.error)),
                                    placeholder: (context, url) => Container(
                                          child: Icon(Icons.error),
                                        ),
                                    fadeInCurve: Curves.fastOutSlowIn,
                                    fit: BoxFit.fill,
                                    imageUrl: viewModel.pathListResponse[index]
                                        .subPaths[i].image)),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      viewModel.jumpTopToNextItem(index, i),
                                  child: Padding(
                                    padding: i == 0
                                        ? const EdgeInsets.only(left: 20.0)
                                        : const EdgeInsets.only(left: 0.0),
                                    child: Text(
                                        viewModel.pathListResponse[index]
                                            .subPaths[i].title
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 4, right: 8),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                )
                              ],
                            )
                          ],
                        );
                      }),
                )
              ],
            );
          }),
    );
  }
}
/*
 Container(
                    height: MediaQuery.of(context).size.height / 4 + 60,
                    // width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: ListView.builder(
                        // controller: _horizontalListCtl,
                        itemCount: 7,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 4,
                                child: Image.asset(
                                  "assets/icons/city.jpg",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                // color: Colors.amber,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _horizontalListCtl.jumpTo(i * 400);
                                      },
                                      child: Padding(
                                        padding: i == 0
                                            ? const EdgeInsets.only(left: 40.0)
                                            : const EdgeInsets.only(left: 0.0),
                                        child: Text("Candelwood country club",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 4, right: 8),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        }),
                  )
               
*/
/*  Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      padding: EdgeInsets.all(8),
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "Candelwood country club",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            WidgetSpan(
                                                child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, top: 4, right: 8),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                                size: 25,
                                              ),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),*/
