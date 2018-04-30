import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FamilyDetailsStep extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FamilyDetailsState();
}


class FamilyDetailsState extends State<FamilyDetailsStep> {

  FamilyDetailsViewModel _familyDetailsViewModel;

  @override
  void initState() {
    super.initState();
    _familyDetailsViewModel = FamilyDetailsViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}

class FamilyDetailsViewModel {

}