import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class FirebaseAuthentication {
  Future<String?> createUser(String email, String username,
      String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      updateUserName(username, _firebaseAuth);
      return credential.user!.uid;
    } on FirebaseAuthException {
      return null;
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      print(credential.user!.uid);
      return credential.user!.uid;
    } on FirebaseAuthException {
      return null;
    }
  }

  Future<bool> logout() async {
    try {
      _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  Future updateUserName(String name, FirebaseAuth currentUser) async {
    await currentUser.currentUser!.updateDisplayName(name);
    await currentUser.currentUser!.reload();
    print(currentUser.currentUser!.displayName);
  }

  getCurrentUser() {
    return _firebaseAuth.currentUser!;
  }

  getUserName(){
    return _firebaseAuth.currentUser!.displayName;
  }

  getUserEmail(){
    return _firebaseAuth.currentUser!.email;
  }

  getCreationTime(){
    return _firebaseAuth.currentUser!.metadata.creationTime;
  }

  getPhoneNumber(){
    return _firebaseAuth.currentUser!.phoneNumber;
  }

  signOut() {
    return _firebaseAuth.signOut();
  }

  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser!).uid;
  }

}