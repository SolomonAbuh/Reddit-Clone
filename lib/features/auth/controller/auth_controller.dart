import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reddit_clone/core/utils.dart';

import '../repository/auth_repository.dart';

final authControllerProvider = Provider(
  ((ref) => AuthController(authRepository: ref.read(authRepositoryProvider))),
);

class AuthController {
  final AuthRepository _authRepository;

  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  void signInWithGoogle(BuildContext context) async {
    final user = await _authRepository.signInWithGoogle();

    user.fold((error) => showSnackBar(context, error.message), (r) => null);
  }
}
