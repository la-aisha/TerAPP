

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ter/model/user.dart';
import 'package:ter/utils/utils.dart';

class MyAuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _isloading = false;
  bool get isLoading => _isloading;

  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  String? _uid;
  String get uid => _uid!;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  MyAuthProvider() {
    checksignin();
  }

  void checksignin() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("issignedin") ?? false;
    notifyListeners();
  }

   Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("is_signedin", true);
    _isSignedIn = true;
    notifyListeners();
  }

  Future saveUserDataToSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString("user_model", jsonEncode(userModel.toMap()));
  }

  Future getDataFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("user_model") ?? '';
    _userModel = UserModel.fromMap(jsonDecode(data));
    _uid = _userModel!.uid;
    notifyListeners();
  }

  Future getDataFromFirestore() async {
    await _firebaseFirestore
        .collection("clients")
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _userModel = UserModel(
        firstname: snapshot['firstname'],
        lastname: snapshot['lastname'],
        createdAt: snapshot['createdAt'],
        //bio: snapshot['bio'],
        uid: snapshot['uid'],
        // profilePic: snapshot['profilePic'],
        phoneNumber: snapshot['phoneNumber'],
      );
      _uid = userModel.uid;
    });
  }


    void signInWithPhone(
      BuildContext context, String phonenumber, UserModel? user) async {
    try {
      _userModel = user;
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phonenumber,
          verificationCompleted: (PhoneAuthCredential phoneauthcrediential) {
            _firebaseAuth.signInWithCredential(phoneauthcrediential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
           /*  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Otp(
                  verificationId: verificationId,
                  user: _userModel ??
                      UserModel(
                        firstname: "",
                        lastname: "",
                        createdAt: "",
                        phoneNumber: "",
                        uid: "",
                      ),
                ),
              ),
            ); */
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }


   void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    Function? onSuccess,
  }) async {
    _isloading = true;
    notifyListeners();
    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      User? user = (await _firebaseAuth.signInWithCredential(creds)).user;
      if (user != null) {
        _uid = user.uid;
        onSuccess!();
        //onSuccessDriver!();
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }


  
  // DATABASE OPERTAIONS
  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("clients").doc(_uid).get();

    if (snapshot.exists) {
      print("user user");
      return true;
    } else {
      print("new USER");
      return false;
    }
  }


   void saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    // required File profilePic,
    required Function onSuccess,
    Function? onFailure,
  }) async {
    _isloading = true;
    notifyListeners();
    try {
      _userModel = userModel;
      // uploading to database
      await _firebaseFirestore
          .collection("clients")
          .doc(_uid)
          .set(userModel.toMap())
          .then((value) {
        onSuccess();
        _isloading = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isloading = false;
      notifyListeners();
      if (onFailure != null) {
        onFailure();
      }
    }
  }






}
