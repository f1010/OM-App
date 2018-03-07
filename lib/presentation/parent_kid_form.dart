// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poc_flutter/models/models.dart';
import 'package:poc_flutter/presentation/date_time_item.dart';
import 'package:poc_flutter/routes/routes.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';
import 'dart:developer';

typedef OnSaveCallback = Function(ParentKidForm);

class ParentKidForm1 extends StatefulWidget {
  OnSaveCallback onSave;
  ParentKidForm parentKidForm;

  ParentKidForm1({Key key, @required this.onSave, @required this.parentKidForm})
      : super(key: key);

  @override
  _ParentKidForm1State createState() => new _ParentKidForm1State(
      onSave: this.onSave, parentKidForm: this.parentKidForm);
}

class _ParentKidForm1State extends State<ParentKidForm1> {
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static final ObjectKey _firstNameKey = new ObjectKey(new FormState());
  static final ObjectKey _lastNameKey = new ObjectKey(new FormState());
  static final ObjectKey _emailKey = new ObjectKey(new FormState());
  static final ObjectKey _relationshipKey = new ObjectKey(new FormState());
  static final ObjectKey _phoneKey = new ObjectKey(new FormState());
  static final ObjectKey _address1Key = new ObjectKey(new FormState());
  static final ObjectKey _address2Key = new ObjectKey(new FormState());
  static final ObjectKey _cityKey = new ObjectKey(new FormState());
  static final ObjectKey _stateKey = new ObjectKey(new FormState());
  static final ObjectKey _zipKey = new ObjectKey(new FormState());

  static final TextEditingController _firstNameController = new TextEditingController();
  static final TextEditingController _lastNameController = new TextEditingController();
  static final TextEditingController _emailController = new TextEditingController();
  static final TextEditingController _relationshipController = new TextEditingController();
  static final TextEditingController _phoneController = new TextEditingController();
  static final TextEditingController _address1Controller = new TextEditingController();
  static final TextEditingController _address2Controller = new TextEditingController();
  static final TextEditingController _cityController = new TextEditingController();
  static final TextEditingController _stateController = new TextEditingController();
  static final TextEditingController _zipController = new TextEditingController();
  OnSaveCallback onSave;

  ParentKidForm parentKidForm;
  _ParentKidForm1State(
      {Key key, @required this.onSave, @required this.parentKidForm});

  String get emptyTextFieldError => Intl.message(
        'Please enter text',
        name: 'emptyFirstNameError',
        args: [],
      );

  String defaultValidator (val) {
    return val.trim().isEmpty
        ? emptyTextFieldError
        : null;
  }

  Widget defaultTextFormField(String hintText, Key key, TextEditingController controller, FormFieldValidator<String> validator) {
    return new ListTile(
      title: new TextFormField(
          decoration: new InputDecoration(
            hintText: hintText,
          ),
          key: key,
          controller: controller,
          initialValue: controller.value.text,
          validator: validator
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Step 1: Family Details'),
      ),
      resizeToAvoidBottomPadding: true,
      body: new Form(
          key: _formKey,
          autovalidate: false,
          child: new Container(
              child: new Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Flexible(
                child: new GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: 4.5,
                    padding: const EdgeInsets.all(4.0),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    children: [
                      defaultTextFormField("Firstname", _firstNameKey, _firstNameController, defaultValidator),
                      defaultTextFormField("Lastname", _lastNameKey, _lastNameController, defaultValidator),
                      defaultTextFormField("Relationship", _relationshipKey, _relationshipController, defaultValidator),
                      defaultTextFormField("Phone", _phoneKey, _phoneController, defaultValidator),
                      defaultTextFormField("Address Line 1", _address1Key, _address1Controller, defaultValidator),
                      defaultTextFormField("Address Line 1", _address2Key, _address2Controller, defaultValidator),
                      defaultTextFormField("City", _cityKey, _cityController, defaultValidator),
                      defaultTextFormField("State", _stateKey, _stateController, defaultValidator),
                      defaultTextFormField("Zip", _zipKey, _zipController, defaultValidator),
                      defaultTextFormField("Email Address", _emailKey, _emailController, defaultValidator),
                    ]),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  new Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: new RaisedButton(
                      onPressed: () {
                        onSave(new ParentKidForm(
                            parent: new Parent(
                              firstName: _firstNameController.value.text,
                              lastName: _lastNameController.value.text,
                              email: _emailController.value.text,
                              address_1:  _address1Controller.value.text,
                              address_2:  _address2Controller.value.text,
                              city: _cityController.value.text,
                              phone: _phoneController.value.text,
                              state: _stateController.value.text,
                              zip: _zipController.value.text
                            ),
                            child: new Child(
                              relationship: _relationshipController.value.text,
                            )));
                        Routes.router.navigateTo(context, "/kids/register/2",
                            transition: TransitionType.inFromLeft);
                      },
                      child: new Text('Next'),
                    ),
                  )
                ],
              )
            ],
          ))),
    );
  }
}

class ParentKidForm2 extends StatefulWidget {
  OnSaveCallback onSave;
  ParentKidForm parentKidForm;

  ParentKidForm2({Key key, @required this.onSave, @required this.parentKidForm})
      : super(key: key);

  @override
  _ParentKidForm2State createState() => new _ParentKidForm2State(
      onSave: this.onSave, parentKidForm: this.parentKidForm);
}

class _ParentKidForm2State extends State<ParentKidForm2> {
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static final ObjectKey _firstNameKey = new ObjectKey(new FormState());
  static final ObjectKey _lastNameKey = new ObjectKey(new FormState());
  static final ObjectKey _startDateKey = new ObjectKey(new FormState());
  static final ObjectKey _dayBirthKey = new ObjectKey(new FormState());
  static final ObjectKey _monthBirthKey = new ObjectKey(new FormState());
  static final ObjectKey _yearBirthKey = new ObjectKey(new FormState());
  static final ObjectKey _classKey = new ObjectKey(new FormState());
  static final ObjectKey _teacherKey = new ObjectKey(new FormState());

  static final TextEditingController _firstNameController = new TextEditingController();
  static final TextEditingController _lastNameController = new TextEditingController();
  static final TextEditingController _startDateController =
      new TextEditingController();
  static final TextEditingController _dayBirthController = new TextEditingController();
  static final TextEditingController _monthBirthController =
      new TextEditingController();
  static final TextEditingController _yearBirthController =
      new TextEditingController();
  static final TextEditingController _classController =
      new TextEditingController();
  static final TextEditingController _teacherController =
      new TextEditingController();

  String get emptyTextFieldError => Intl.message(
    'Please enter text',
    name: 'emptyFirstNameError',
    args: [],
  );

  String defaultValidator (val) {
    return val.trim().isEmpty
        ? emptyTextFieldError
        : null;
  }

  Widget defaultTextFormField(String hintText, Key key, TextEditingController controller, FormFieldValidator<String> validator) {
    return new ListTile(
      title: new TextFormField(
          decoration: new InputDecoration(
            hintText: hintText,
          ),
          key: key,
          controller: controller,
          initialValue: controller.value.text,
          validator: validator
      ),
    );
  }

  Widget defaultTitle(BuildContext context, String title) {
    return new Text(
      title,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.apply(fontSizeFactor: 1.5).title,
    );
  }

  final OnSaveCallback onSave;
  final ParentKidForm parentKidForm;

  // to remove maybe
  String radioValue = "male";
  bool addressSameAsParent = false;

  var _startDate = new DateTime.now();

  // Age Range dropdown
  dynamic ddAgeRange;

  // Allergies
  bool chkAllergyDairy = false;
  bool chkAllergyNuts = false;
  bool chkAllergyGluten = false;

  // Special instructions
  bool chkVegetarian = false;
  bool chkBringsOwnFood = false;

  void handleRadioValueChanged(String value) {
//    setState(() {
    radioValue = value;
    // });
  }

  void handleCheckboxValueChanged(bool value) {
//    setState(() {
    addressSameAsParent = value;
//    });
  }

  void chkAllergyDairyChanged(bool value) {
//    setState(() {
    chkAllergyDairy = value;
//    });
  }

  void chkAllergyNutsChanged(bool value) {
//    setState(() {
    chkAllergyNuts = value;
//    });
  }

  void chkAllergyGlutenChanged(bool value) {
//    setState(() {
    chkAllergyGluten = value;
//    });
  }

  void chkVegetarianChanged(bool value) {
//    setState(() {
    chkVegetarian = value;
//    });
  }

  void chkBringsOwnFoodChanged(bool value) {
//    setState(() {
    chkBringsOwnFood = value;
//    });
  }

  void ddAgeRangeChanged(dynamic value) {
//    setState(() {
    ddAgeRange = value;
//    });
  }

  void handleDropDownValueChanged(dynamic value) {
//    setState(() {});
  }

  void uploadPictureButton() {}

  void _submit() {}

  _ParentKidForm2State(
      {Key key, @required this.onSave, @required this.parentKidForm});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Step 2: Kid\'s Details'),
        ),
        resizeToAvoidBottomPadding: true,
        body: new Form(
            child: new Container(
                child: new Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Flexible(
              child: new GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: 4.5,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: [
                    defaultTextFormField("Firstname", _firstNameKey, _firstNameController, defaultValidator),
                    defaultTextFormField("Lastname", _lastNameKey, _lastNameController, defaultValidator),
                    new Row(
                      children: <Widget>[
                        new Flexible(
                          child: defaultTextFormField("Birth day", _dayBirthKey, _dayBirthController, defaultValidator),
                        ),
                        new Flexible(
                          child: defaultTextFormField("Birth month", _monthBirthKey, _monthBirthController, defaultValidator),
                        ),
                        new Flexible(
                          child: defaultTextFormField("Birth year", _yearBirthKey, _yearBirthController, defaultValidator),
                        ),
                      ],
                    ),
                    new Row(children: [
                      new Flexible(
                          child: new DropdownButton(
                              onChanged: ddAgeRangeChanged,
                              hint: new Text("Age range"),
                              value: ddAgeRange,
                              items: [
                            new DropdownMenuItem(
                              child: new Text("2 years"),
                            )
                          ]))
                    ]),
                    defaultTextFormField("Class Name", _classKey, _classController, defaultValidator),
                    defaultTextFormField("Teacher Name", _teacherKey, _teacherController, defaultValidator),
                    new Row(
                      children: <Widget>[
                        new Radio<String>(
                            value: "Male",
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged),
                        new Text("Male"),
                        new Divider(),
                        new Radio<String>(
                            value: "Female",
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged),
                        new Text("Female"),
                      ],
                    ),
                    new Row(
                      children: [
                        new Checkbox(
                            value: addressSameAsParent,
                            onChanged: handleCheckboxValueChanged),
                        new Text("Same address as "),
                        new Flexible(
                          child: new DropdownButton(
                            onChanged: handleDropDownValueChanged,
                            items: new List.generate(20, (int index) {
                              return new DropdownMenuItem(
                                  child: new Container(
                                child: new Text("Item#$index"),
                              ));
                            }),
                          ),
                        ),
                      ],
                    ),
                    defaultTitle(context, "Allergies"),
                    /*new Text(
                      "Allergies",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.5),
                    ),*/
                    new Row(
                      children: [
                        new Checkbox(
                            value: chkAllergyDairy,
                            onChanged: chkAllergyDairyChanged),
                        new Text("Dairy"),
                        new Checkbox(
                            value: chkAllergyNuts,
                            onChanged: chkAllergyNutsChanged),
                        new Text("Nuts"),
                        new Checkbox(
                            value: chkAllergyGluten,
                            onChanged: chkAllergyGlutenChanged),
                        new Text("Gluten"),
                      ],
                    ),
                    new Container(
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.blueAccent)),
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          hintText:
                              "For EACH allergy, explain what the parent/guardian wants to do (if there is a reaction)",
                        ),
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    defaultTitle(context, "Special Instructions"),
                    new Row(
                      children: [
                        new Checkbox(
                            value: chkVegetarian,
                            onChanged: chkVegetarianChanged),
                        new Text("Vegetarian"),
                        new Checkbox(
                            value: chkBringsOwnFood,
                            onChanged: chkBringsOwnFoodChanged),
                        new Text("Brings own food"),
                      ],
                    ),
                    new Row(
                      children: [
                        defaultTitle(context, "Picture"),
                        new RaisedButton(
                            onPressed: uploadPictureButton,
                            child: new Text("Upload"))
                      ],
                    ),
                    new Container(
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.blueAccent)),
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          hintText: "Notes",
                        ),
                        maxLines: 6,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    new Text(
                      "Start Date",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.5),
                    ),
                    new Row(
                      children: [
                        new Flexible(
                          child: new DateTimeItem(
                            key: _startDateKey,
                            dateTime: _startDate,
                            //onChanged: (dateTime) => _startDate = dateTime,
                            onChanged: (dateTime) {
                              onSave(new ParentKidForm(
                                  child: new Child(
                                    startDate: dateTime.toUtc().toString(),
                                  )));
                            },
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                new Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new RaisedButton(
                    onPressed: () {
                      onSave(new ParentKidForm(
                          child: new Child(
                        firstName: _firstNameController.value.text,
                        startDate: _startDate.toUtc().toString(),
                        birthDate: mergeBirthDate(),
                      )));
                      Routes.router.navigateTo(context, "/kids/register/3",
                          transition: TransitionType.inFromLeft);
                    },
                    child: new Text('Save'),
                  ),
                )
              ],
            )
          ],
        ))));
  }

  String mergeBirthDate() {
    return "${_yearBirthController.value.text}/${_monthBirthController.value.text}/${_dayBirthController.value.text}";
  }
}

class ParentKidForm3 extends StatelessWidget {
  ParentKidForm parentKidForm;

  ParentKidForm3({Key key, @required this.parentKidForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // todo: solve bug, it executes twice because of animation
    parentKidForm.saveToDb();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Step 3: send'),
      ),
      // yes we have access to parentKidForm information !
      // can now send to the backend !
      body: new ListView(
          children: [
             new Text(parentKidForm.parent.toString()),
             new Text(parentKidForm.child.toString()),
          ]),
    );
  }
}
