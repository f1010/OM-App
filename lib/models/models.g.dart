// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ParentKidForm _$ParentKidFormFromJson(Map<String, dynamic> json) =>
    new ParentKidForm(
        complete: json['complete'],
        parent: json['parent'] == null
            ? null
            : new Parent.fromJson(json['parent'] as Map<String, dynamic>),
        child: json['child'] == null
            ? null
            : new Child.fromJson(json['child'] as Map<String, dynamic>));

abstract class _$ParentKidFormSerializerMixin {
  bool get complete;
  Parent get parent;
  Child get child;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'complete': complete, 'parent': parent, 'child': child};
}

Parent _$ParentFromJson(Map<String, dynamic> json) => new Parent(
    id: json['id'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    address_1: json['address_1'] as String,
    address_2: json['address_2'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    zip: json['zip'] as String);

abstract class _$ParentSerializerMixin {
  String get id;
  String get firstName;
  String get lastName;
  String get email;
  String get phone;
  String get address_1;
  String get address_2;
  String get city;
  String get state;
  String get zip;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'address_1': address_1,
        'address_2': address_2,
        'city': city,
        'state': state,
        'zip': zip
      };
}

Child _$ChildFromJson(Map<String, dynamic> json) => new Child(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    gender: json['gender'] as String,
    startDate: json['startDate'] as String,
    relationship: json['relationship'] as String,
    parentId: json['parentId'] as String,
    birthDate: json['birthDate'] as String);

abstract class _$ChildSerializerMixin {
  String get firstName;
  String get lastName;
  String get gender;
  String get startDate;
  String get relationship;
  String get parentId;
  String get birthDate;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'startDate': startDate,
        'relationship': relationship,
        'parentId': parentId,
        'birthDate': birthDate
      };
}
