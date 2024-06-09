import 'package:fb_clone/core/constants/firebase_field_name.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserModel {
  final String fullName;
  final DateTime birthDay;
  final String gender;
  final String email;
  final String password;
  final String profilePicUrl;
  final String uid;
  final List<String> friends;
  final List<String> sentRequests;
  final List<String> receivedRequests;

  const UserModel({
    required this.fullName,
    required this.birthDay,
    required this.gender,
    required this.email,
    required this.password,
    required this.profilePicUrl,
    required this.uid,
    required this.friends,
    required this.sentRequests,
    required this.receivedRequests,
  });

  Map<String, dynamic> toMap() {
    return {
      FirebaseFieldNames.fullName: fullName,
      FirebaseFieldNames.birthDay: birthDay.millisecondsSinceEpoch,
      FirebaseFieldNames.gender: gender,
      FirebaseFieldNames.email: email,
      FirebaseFieldNames.password: password,
      FirebaseFieldNames.profilePicUrl: profilePicUrl,
      FirebaseFieldNames.uid: uid,
      FirebaseFieldNames.friends: friends,
      FirebaseFieldNames.sentRequests: sentRequests,
      FirebaseFieldNames.receivedRequests: receivedRequests,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map[FirebaseFieldNames.fullName] ?? '',
      birthDay:
          DateTime.fromMillisecondsSinceEpoch(map[FirebaseFieldNames.birthDay]),
      gender: map[FirebaseFieldNames.gender] ?? '',
      email: map[FirebaseFieldNames.email] ?? '',
      password: map[FirebaseFieldNames.password] ?? '',
      profilePicUrl: map[FirebaseFieldNames.profilePicUrl] ?? '',
      uid: map[FirebaseFieldNames.uid] ?? '',
      friends: List<String>.from(map[FirebaseFieldNames.friends] ?? []),
      sentRequests:
          List<String>.from(map[FirebaseFieldNames.sentRequests] ?? []),
      receivedRequests:
          List<String>.from(map[FirebaseFieldNames.receivedRequests] ?? []),
    );
  }
}
