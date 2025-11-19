import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<Object?> routeNavigator(Widget route, BuildContext context) {
  return Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => route));
}
