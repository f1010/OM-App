import 'package:poc_flutter/models/models.dart';


class UpdateParentKidFormAction {
  final ParentKidForm updatedParentKidForm;

  UpdateParentKidFormAction(this.updatedParentKidForm);

  @override
  String toString() {
    return 'UpdateParentKidFormAction{updatedParentKidForm: $updatedParentKidForm}';
  }
}