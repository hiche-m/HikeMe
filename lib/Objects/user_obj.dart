import 'package:hikeme/Objects/location.dart';

class UserObject {
  final int uid;
  final String firstName;
  final String lastName;
  final String email;
  Location? location;

  UserObject({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.location,
  });
}
