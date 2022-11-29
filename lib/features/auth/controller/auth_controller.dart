import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reddit_clone/core/providers/firebase_providers.dart';

import '../repository/auth_repository.dart';

final authControllerProvider = Provider(
  ((ref) => AuthRepository(
        firestore: ref.read(firestoreProvider),
        auth: ref.read(firebaseAuthProvider),
        googleSignIn: ref.read(googleSignInProvider),
      )),
);

class AuthController {
  final AuthRepository _authRepository;

  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  void signInWithGoogle() {
    _authRepository.signInWithGoogle();
  }
}
