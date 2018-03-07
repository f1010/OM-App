// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:poc_flutter/models/app_state.dart';
import 'package:poc_flutter/reducers/parent_kid_form_reducer.dart';

// We create the State reducer by combining many smaller reducers into one!
AppState appReducer(AppState state, action) {
  return new AppState(
    parentKidForm: parentKidFormReducer(state.parentKidForm, action),
  );
}
