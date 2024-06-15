import 'package:fb_clone/features/friends/repository/friend_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final friendProvider = Provider((ref) {
  return FriendRepository();
});
