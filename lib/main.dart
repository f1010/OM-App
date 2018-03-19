import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:poc_flutter/routes/routes.dart';
import 'package:poc_flutter/models/app_state.dart';
import 'package:poc_flutter/reducers/reducers.dart';

void main() {
  runApp(new ReduxApp());
}

class ReduxApp extends StatelessWidget {
  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState.loading(),
//    middleware: createStoreTodosMiddleware(), maybe todo
  );

  ReduxApp();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],
        ),
        onGenerateRoute: Routes.router.generator,
      ),
    );
  }
}

