/*
library child;

import 'package:json_annotation/json_annotation.dart';

part 'child.g.part';

@JsonSerializable()
class Child extends Object with _$ChildSerializerMixin {
  Child(this.id, this.firstName, this.lastName, this.birthDate, this.gender, this.imageUri, this.notes, this.allergies, this.specialInstructions);

  final String id;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String gender;
  final String imageUri;
  final String notes;
  final List<String> allergies;

  final List<String> specialInstructions;

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);

*/
/* Child.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        birthDate = json['birthDate'],
        gender = json['gender'],
        imageUri = json['imageUri'],
        notes = json['notes'],
        allergies = json['allergies'],
        specialInstructions = json['specialInstructions'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'birthDate': birthDate,
        'gender': gender,
        'imageUri': imageUri,
        'notes': notes,
        'allergies': allergies,
        'specialInstructions': specialInstructions,
      };*//*

}*/
