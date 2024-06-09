import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_clone/core/constants/firebase_collection_name.dart';
import 'package:fb_clone/core/constants/firebase_field_name.dart';
import 'package:fb_clone/features/post/model/post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

@immutable
class PostRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  // make post
  Future<String?> makePost({
    required String content,
    required File file,
    required String postType,
  }) async {
    try {
      final postId = const Uuid().v1();
      final posterId = _auth.currentUser!.uid;
      final now = DateTime.now();

      // post to storage
      final fileId = const Uuid().v1();
      final path = _storage.ref(postType).child(fileId);
      final taskSnapshot = await path.putFile(file);
      final downloadUrl = await taskSnapshot.ref.getDownloadURL();

      Post post = Post(
        postId: postId,
        posterId: posterId,
        content: content,
        postType: postType,
        fileUrl: downloadUrl,
        createdAt: now,
        likes: [],
      );

      // post to firestore
      _firestore
          .collection(FirebaseCollectionNames.posts)
          .doc(postId)
          .set(post.toMap());
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // like a post
  Future<String?> likeDislikepost({
    required String postId,
    required List<String> likes,
  }) async {
    try {
      final authorId = _auth.currentUser!.uid;

      if (likes.contains(authorId)) {
        _firestore.collection(FirebaseCollectionNames.posts).doc(postId).update(
          {
            FirebaseFieldNames.likes: FieldValue.arrayRemove([authorId])
          },
        );
      } else {
        _firestore.collection(FirebaseCollectionNames.posts).doc(postId).update(
          {
            FirebaseFieldNames.likes: FieldValue.arrayUnion([authorId])
          },
        );
      }
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
