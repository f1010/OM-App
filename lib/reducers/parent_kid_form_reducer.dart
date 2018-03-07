import 'package:redux/redux.dart';
import 'package:poc_flutter/actions/actions.dart';
import 'package:poc_flutter/models/models.dart';

final parentKidFormReducer = combineTypedReducers<ParentKidForm>([
  new ReducerBinding<ParentKidForm, UpdateParentKidFormAction>(_updateParentKidForm),
]);

ParentKidForm _updateParentKidForm(ParentKidForm parentKidForm, UpdateParentKidFormAction action) {
  print(parentKidForm);
  print(action);
  return parentKidForm.copyWith(
      complete: action.updatedParentKidForm.complete,
      parent: action.updatedParentKidForm.parent,
      child: action.updatedParentKidForm.child);
}
