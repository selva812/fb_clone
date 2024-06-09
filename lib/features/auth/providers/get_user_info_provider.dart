import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_clone/core/constants/firebase_collection_name.dart';
import 'package:fb_clone/features/auth/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

final getUserInfoProvider = FutureProvider.autoDispose<UserModel>((ref) {
  return FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.users)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((userdata) {
    return UserModel.fromMap(userdata.data()!);
  });
});
