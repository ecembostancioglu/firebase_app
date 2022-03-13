import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final _firebaseAuth=FirebaseAuth.instance;

  Future<User?>createUserWithEmailandPassword(
      String email,String password) async{
    final userCredentials=await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredentials.user;
  }

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

  Stream<User?> authStatus(){
    return _firebaseAuth.authStateChanges();
  }
}