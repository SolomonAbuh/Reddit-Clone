import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);
final googleSignInProvider = Provider((ref) => GoogleSignIn());
final storageProvider = Provider((ref) => FirebaseStorage.instance);
final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
