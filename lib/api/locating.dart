import 'package:firebase_auth/firebase_auth.dart';

class AuthenticanService {
  final FirebaseAuth _firebaseAuth;

  AuthenticanService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String password}) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed In";
      
    } on FirebaseAuthException catch (e) {
      return 'Error Password';
    }

  }
  Future<String> signUp({String fullName,String email, String password})async{
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed Up";
    } catch (e) {
      return e.message;
    }

  }
}