import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
@immutable
class ParentKidForm extends Object with _$ParentKidFormSerializerMixin {
  final bool complete;

  final Parent parent;
  final Child child;

  factory ParentKidForm.fromJson(Map<String, dynamic> json) => _$ParentKidFormFromJson(json);

  ParentKidForm({complete = false, Parent parent, Child child})
      : this.complete = complete ?? false,
      this.parent = parent ?? new Parent(),
      this.child = child ?? new Child();

  ParentKidForm copyWith({bool complete, Parent parent, Child child}) {
    return new ParentKidForm(
      complete: complete ?? this.complete,
      parent: this.parent.copyWith(firstName: parent.firstName, lastName: parent.lastName, email: parent.email, city:  parent.city, zip: parent.zip, state: parent.state, phone: parent.phone,
      address_2: parent.address_2, address_1: parent.address_1),
      child: this.child.copyWith(firstName: child.firstName, lastName: child.lastName, gender: child.gender, relationship: child.relationship, startDate: child.startDate,birthDate: child.birthDate,parentId: child.parentId)
    );
  }

  @override
  int get hashCode => complete.hashCode ^ parent.hashCode ^ child.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ParentKidForm &&
              runtimeType == other.runtimeType &&
              complete == other.complete &&
              parent == other.parent &&
              child == other.child;

  @override
  String toString() {
    return 'ParentKidForm{complete: $complete, parent: $parent, child: $child}';
  }

  void saveToDb() {
    var registerParentUrl = 'http://35.205.143.130/api/v1/adults';
    var registerChildUrl = 'http://35.205.143.130/api/v1/children';
    var token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImRhNWZiMGJkZTJlMzUwMmZkZTE1YzAwMWE0MWIxYzkxNDc4MTI0NzYifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vdGVkZHljYXJlLTE5MzkxMCIsIm5hbWUiOiJBcnRodXIgR3VzdGluIiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS8tWGRVSXFkTWtDV0EvQUFBQUFBQUFBQUkvQUFBQUFBQUFBQUEvNDI1MnJzY2J2NU0vcGhvdG8uanBnIiwiYWRtaW4iOnRydWUsImFkdWx0IjpmYWxzZSwib2ZmaWNlbWFuYWdlciI6ZmFsc2UsInRlYWNoZXIiOmZhbHNlLCJ1c2VySWQiOiJlOTU2OWY5ZC0yMmVkLTQyOTctOTAwOC0wMzlkMTIwOWEzMmEiLCJhdWQiOiJ0ZWRkeWNhcmUtMTkzOTEwIiwiYXV0aF90aW1lIjoxNTIxNDEyMzA4LCJ1c2VyX2lkIjoid0FnVUpQQ0IzRk92aDVEck1XanZMTm45bzIwMiIsInN1YiI6IndBZ1VKUENCM0ZPdmg1RHJNV2p2TE5uOW8yMDIiLCJpYXQiOjE1MjE0MTIzMDksImV4cCI6MTUyMTQxNTkwOSwiZW1haWwiOiJhcnRodXIuZ3VzdGluQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7Imdvb2dsZS5jb20iOlsiMTE0MjQxNDU1NTI0MTUyMzUyMTUwIl0sImVtYWlsIjpbImFydGh1ci5ndXN0aW5AZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoiZ29vZ2xlLmNvbSJ9fQ.Et97UW8WR6XlMqIUWYNrJTjLcXeIQRaFdhiDdXDr8dbF90I5IacxwgmqUsrC8GePHq99FdfjlIY-XZCOGeChew31EpqhRBB08SI1whqnqnPRmCEGxErTtmt9ZPBqKQSBB4j6v8swOvIG9UUanqHm4Mo4AQh0_M0a7rpuk-RHar8B4Fp4VCFbi66ALUu4z7X7QtjJ7t2LSvW6h6KCXlXSq9dSXcftdUW-IYWR2QLHQH838e8digTXdmmXAp5qwe2JmbWORGXdfA-05aJezUorxU7-73VAORHfz8BjKAZ1Qfqa07wDjhWfhNVxZmmvfsH4zatt1K0C8wKHP9bnJOAhsg';
    String json = JSON.encode(this.parent);
    http.post(
        registerParentUrl,
        body: json,
        headers: {
          'authorization' : 'bearer $token',
          'content-type':'application/json'
        }).then((response) {
          print("status: ${response.statusCode} body:  ${response.body}");
          var jsonResponse = JSON.decode(response.body);
          Parent createdParent = new Parent.fromJson(jsonResponse);

          String json = JSON.encode(this.child.copyWith(parentId: createdParent.id));
          http.post(
              registerChildUrl,
              body: json,
              headers: {
                'authorization' : 'bearer $token',
                'content-type':'application/json'
              }).then((response) {
            print("status: ${response.statusCode} body:  ${response.body}");
          });
        });
  }
}

@JsonSerializable()
@immutable
class Parent extends Object with _$ParentSerializerMixin {
  final String id,firstName,lastName,email,phone,address_1,address_2,city,state,zip;

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);

  Parent({String id = '', String firstName = '', String lastName = '', String email = '',
  String phone = '', String address_1 = '', String address_2 = '', String city = '', String state = '', String zip = ''})
      : this.id = id ?? '',
        this.firstName = firstName ?? '',
        this.lastName = lastName ?? '',
        this.email = email ?? '',
        this.phone = phone ?? '',
        this.address_1 = address_1 ?? '',
        this.address_2 = address_2 ?? '',
        this.city = city ?? '',
        this.state = state ?? '',
        this.zip = zip ?? '';

  Parent copyWith({String id, String firstName, String lastName, String email, String phone, String address_1, String address_2, String city, String state, String zip}) {
    return new Parent(
      id: id == '' ? this.id : id,
      firstName: firstName == '' ?  this.firstName : firstName,
      lastName: lastName == '' ?  this.lastName : lastName,
      email: email == '' ?  this.email : email,
      phone: phone == '' ?  this.phone : phone,
      address_1: address_1 == '' ?  this.address_1 : address_1,
      address_2: address_2 == '' ?  this.address_2 : address_2,
      city: city == '' ?  this.city : city,
      state: state == '' ?  this.state : state,
      zip: zip == '' ?  this.zip : zip,
    );
  }

  @override
  int get hashCode => id.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ email.hashCode ^ phone.hashCode ^ address_1.hashCode ^ address_2.hashCode ^ city.hashCode ^ state.hashCode ^ zip.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Parent &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              firstName == other.firstName &&
              email == other.email &&
              lastName == other.lastName &&
              phone == other.phone &&
              address_1 == other.address_1 &&
              address_2 == other.address_2 &&
              city == other.city &&
              state == other.state &&
              zip == other.zip;

  @override
  String toString() {
    return 'Parent{id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, address_1: $address_1, address_2: $address_2, city: $city, state: $state, zip: $zip}';
  }
}

@JsonSerializable()
@immutable
class Child extends Object with _$ChildSerializerMixin {
  final String firstName;
  final String lastName;
  final String gender;
  final String startDate;
  final String relationship;
  final String parentId;
  final String birthDate;

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);

  Child({String firstName = '', String lastName = '', String gender = '', String startDate = '', String relationship = '', String parentId = '', String birthDate = ''})
      : this.firstName = firstName ?? '',
        this.lastName = lastName ?? '',
        this.gender = gender ?? '',
        this.startDate = startDate ?? '',
        this.relationship = relationship ?? '',
        this.parentId = parentId ?? '',
        this.birthDate = birthDate ?? '';

  Child copyWith({String firstName, String lastName, String gender, String startDate, String relationship, String parentId, String birthDate}) {
    return new Child(
      firstName: firstName == '' ? this.firstName : firstName,
      lastName: lastName == '' ? this.lastName : lastName,
      gender: gender == '' ? this.gender : gender,
      startDate: startDate == '' ? this.startDate : startDate,
      relationship: relationship == '' ? this.relationship : relationship,
      parentId: parentId == '' ? this.parentId : parentId,
      birthDate: birthDate == '' ? this.birthDate : birthDate,
    );
  }

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ gender.hashCode ^ startDate.hashCode ^ relationship.hashCode ^ parentId.hashCode ^ birthDate.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Child &&
              runtimeType == other.runtimeType &&
              firstName == other.firstName &&
              gender == other.gender &&
              lastName == other.lastName &&
              startDate == other.startDate &&
              relationship == other.relationship &&
              parentId == other.parentId &&
              birthDate == other.birthDate;

  @override
  String toString() {
    return 'Child{firstName: $firstName, lastName: $lastName, gender: $gender, startDate: $startDate, relationship: $relationship, parentId: $parentId}, birthDate: $birthDate';
  }
}