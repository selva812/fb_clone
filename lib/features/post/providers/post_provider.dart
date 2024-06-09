import 'package:fb_clone/features/post/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postsProvider = Provider(
  (ref) {
    return PostRepository();
  },
);
