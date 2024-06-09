import 'package:fb_clone/features/auth/repository/auth_repository.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = Provider((ref) {
  return AuthRepository();
});
