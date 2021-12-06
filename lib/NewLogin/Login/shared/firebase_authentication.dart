import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:sms_autofill/sms_autofill.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class FirebaseAuthentication {

  Future<String?> createUser(String email, String username,
      String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      updateUserName(username, getCurrentUser());
      return credential.user!.uid;
    } on FirebaseAuthException {
      return null;
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      // print(credential.user!.uid);
      updateUserName(getUserName(), getCurrentUser());
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

  Future updateUser(String name, String sex , String phone, User currentUser) async {
    await currentUser.updateDisplayName(name + '|' + sex + '|' + phone);
    await currentUser.reload();
  }

  Future updateUserName(String name, User currentUser) async{
    if(name == getUserName()) return;
    await currentUser.updateDisplayName(name + '|' + getUserSex() + '|' + getUserPhone());
    await currentUser.reload();
  }

  Future updateUserSex(String sex, User currentUser) async{
    if(sex == getUserSex()) return;
    await currentUser.updateDisplayName(getUserName() + '|' + sex + '|' + getUserPhone());
    await currentUser.reload();
  }

  Future updateUserPhone(String phone, User currentUser) async{
    if(phone == getUserPhone()) return;
    await currentUser.updateDisplayName(getUserName() + '|' + getUserSex() + '|' + phone);
    await currentUser.reload();
  }


  getCurrentUser() {
    return _firebaseAuth.currentUser!;
  }

  getUserName(){
    var displayName = _firebaseAuth.currentUser!.displayName.toString();
    try {
      var parts = displayName.split('|');
      return parts[0];
    }
    catch(e){

    }
      return "None";
  }

  getUserSex(){
    var displayName = _firebaseAuth.currentUser!.displayName.toString();
    try {
      var parts = displayName.split('|');
      return parts[1];
    }
    catch(e){

    }
    return "None";
  }

  getUserPhone(){
    print(getCurrentUser().displayName.toString());
    var displayName = _firebaseAuth.currentUser!.displayName.toString();
    try {
    var parts = displayName.split('|');
    return parts[2];
    }
    catch(e){

    }
    return "None";
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