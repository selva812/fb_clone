import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_clone/core/constants/firebase_collection_name.dart';
import 'package:fb_clone/features/auth/models/user.dart';

import 'package:riverpod/riverpod.dart';

final getUserInfoProvider =
    FutureProvider.autoDispose.family<UserModel, String>((ref, userid) {
  return FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.users)
      .doc(userid)
      .get()
      .then((userdata) {
    return UserModel.fromMap(userdata.data()!);
  });
});
