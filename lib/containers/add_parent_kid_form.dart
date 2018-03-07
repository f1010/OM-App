import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:poc_flutter/models/app_state.dart';
import 'package:poc_flutter/presentation/parent_kid_form.dart';
import 'package:poc_flutter/actions/actions.dart';
import 'package:poc_flutter/models/models.dart';
import 'package:poc_flutter/models/keys.dart';

class ResponsiveWidget extends InheritedWidget {
  static ResponsiveWidget of(BuildContext context) => context.inheritFromWidgetOfExactType(ResponsiveWidget);
  final MediaQueryData _data;
  String get deviceWidth => _data.size.width.toString();
  Orientation get orientation => _data.orientation;

  ResponsiveWidget({
    Key key,
    MediaQueryData data,
    Widget child,
  })
      : _data = data,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(ResponsiveWidget oldWidget) => _data != oldWidget._data;
}

class AddParentKidForm1 extends StatelessWidget {
  AddParentKidForm1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnSaveCallback>(
      converter: (Store<AppState> store) {
        return (formValues) {
          store.dispatch(new UpdateParentKidFormAction(new ParentKidForm(
            complete: formValues.complete,
            parent: formValues.parent,
            child: formValues.child,
          )));
        };
      },
      builder: (BuildContext context, OnSaveCallback onSave) {
        return new ParentKidForm1(
          key: ArchSampleKeys.parentKidForm1,
          onSave: onSave,
          parentKidForm: new ParentKidForm(),
        );
      },
    );
  }
}

class AddParentKidForm2 extends StatelessWidget {
  AddParentKidForm2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnSaveCallback>(
      converter: (Store<AppState> store) {
        return (formValues) {
          store.dispatch(new UpdateParentKidFormAction(new ParentKidForm(
            complete: formValues.complete,
            parent: formValues.parent,
            child: formValues.child,
          )));
        };
      },
      builder: (BuildContext context, OnSaveCallback onSave) {
        return new ParentKidForm2(
          key: ArchSampleKeys.parentKidForm2,
          onSave: onSave,
          parentKidForm: new ParentKidForm(),
        );
      },
    );
  }
}

class AddParentKidForm3 extends StatelessWidget {
  AddParentKidForm3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ParentKidForm>(
      converter: (Store<AppState> store) {
        return store.state.parentKidForm;
      },
      builder: (BuildContext context, ParentKidForm parentKidForm) {
        return new ParentKidForm3(
          key: ArchSampleKeys.parentKidForm3,
          parentKidForm: parentKidForm,
        );
      },
    );
  }
}