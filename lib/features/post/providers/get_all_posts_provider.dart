import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_clone/core/constants/firebase_collection_name.dart';
import 'package:fb_clone/core/constants/firebase_field_name.dart';
import 'package:fb_clone/features/post/model/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllPostsProvider = StreamProvider((ref) {
  final controller = StreamController<Iterable<Post>>();
  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.posts)
      .orderBy(FirebaseFieldNames.createdAt, descending: true)
      .snapshots()
      .listen((snapshot) {
    final posts = snapshot.docs.map(
      (postData) => Post.fromMap(
        postData.data(),
      ),
    );
    controller.sink.add(posts);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
