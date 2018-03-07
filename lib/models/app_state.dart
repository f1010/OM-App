// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:meta/meta.dart';
import 'package:poc_flutter/models/models.dart';

@immutable
class AppState {
  final bool isLoading;
  final ParentKidForm parentKidForm;
  

  AppState({
        this.isLoading = false,
        this.parentKidForm = null,
      });

  factory AppState.loading() => new AppState(isLoading: true, parentKidForm: new ParentKidForm());

  AppState copyWith({
    bool isLoading,
    ParentKidForm parentKidForm
  }) {
    return new AppState(
      isLoading: isLoading ?? this.isLoading,
      parentKidForm: parentKidForm ?? this.parentKidForm,
    );
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      parentKidForm.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              isLoading == other.isLoading &&
              parentKidForm == other.parentKidForm;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, parentKidForm: $parentKidForm}';
  }
}
