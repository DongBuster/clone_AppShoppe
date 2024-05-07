import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/home_page_state.dart';

class HomePageController {
  setHomePageState(ScrollNotification notification, BuildContext context) {
    if (notification.metrics.pixels < 20 &&
        notification.metrics.axis == Axis.vertical) {
      Provider.of<HomePageState>(context, listen: false).setStateFalse();
    } else if (notification.metrics.pixels >= 20 &&
        notification.metrics.axis == Axis.vertical) {
      Provider.of<HomePageState>(context, listen: false).setStateTrue();
    }
  }
}
