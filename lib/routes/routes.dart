import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poc_flutter/containers/add_parent_kid_form.dart';
import 'package:poc_flutter/presentation/home_page.dart';


class Routes {
  static final Router router = configureRoutes(new Router());

  static Router configureRoutes(Router router) {
    // Define our home page.
    router.define('/', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return new HomePage();
        }));

    // Define our about page.
    router.define('/kids/register/1', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return new AddParentKidForm1();
        }));

    // Define our about page.
    router.define('/kids/register/2', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return new AddParentKidForm2();
        }));

    // Define our about page.
    router.define('/kids/register/3', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return new AddParentKidForm3();
        }));
    return router;
  }
}