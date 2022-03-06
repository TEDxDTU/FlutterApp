import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tedx_dtu_app/helpers/classes/ui_helper.dart';
import 'package:tedx_dtu_app/helpers/constants/constants.dart';

class Auth extends ChangeNotifier {
  late final FirebaseAuth _auth;

  Auth() : _auth = FirebaseAuth.instance;
  Future<void> signUp({
    required String email,
    required String password,
    required File image,
    required String name,
    required String university,
  }) async {
    try {
      final url = Uri.parse(nodeServerBaseUrl + '/api/user/sign-up');
      // final ref = FirebaseStorage.instance
      //     .ref()
      //     .child('user-images')
      //     .child(email + '.png');

      // await ref.putFile(image, SettableMetadata(contentType: 'image/png'));
      // final imageUrl = await ref.getDownloadURL();
      final imageUrl = await uploadUserImage(email, image);
      final response = await http.post(url, body: {
        'email': email,
        'password': password,
        'name': name,
        'university': university,
        'imageURL': imageUrl,
      });
      if (response.statusCode == 200) {
        signIn(email: email, password: password);
      } else {
        Map<String, dynamic> error = jsonDecode(response.body);
        if (error['code'] != 'user_exists') deleteUserImage(email);
        throw Exception(error['msg']);
      }
    } on Exception catch (e) {
      print(e);
      throw Exception('Failed to sign up, $e');
    }
  }

  _TedXUser? user;
  bool get isAuth => _auth.currentUser != null && user != null;
  void loginAnon() {
    isAnonymousLogin = true;
    // _auth.signInAnonymously();
    notifyListeners();
  }

  Future<void> autoLogin() async {
    final user = _auth.currentUser;
    if (user == null) {
      return;
    }
    await _getDataFromToken(_auth.currentUser!.email!);
  }

  bool isAnonymousLogin = false;
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _getDataFromToken(email);
    } on Exception catch (e) {
      throw Exception('Failed to sign in, $e');
    }
  }

  Future<void> _getDataFromToken(String email) async {
    try {
      final url = Uri.parse(nodeServerBaseUrl + '/api/user/data-from-token');
      String authToken = (await _auth.currentUser!.getIdToken());
      print('here2');
      final response = await http.post(url, body: {
        'email': email,
        'authToken': authToken,
      });
      print("after response");
      if (response.statusCode == 200) {
        user = _TedXUser.fromMap(json.decode(response.body));
        notifyListeners();
      } else {
        throw Exception('${json.decode(response.body)['msg']}');
      }
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    user = null;
    notifyListeners();
  }

  Future<String> uploadUserImage(String userEmail, File image) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('user-images')
        .child(userEmail + '.png');

    await ref.putFile(image, SettableMetadata(contentType: 'image/png'));
    final imageUrl = await ref.getDownloadURL();
    return imageUrl;
  }

  Future<void> deleteUserImage(String userEmail) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('user-images')
        .child(userEmail + '.png');
    await ref.delete();
  }

  Future<void> tryChangePassword(BuildContext ctx) async {
    try {
      _auth.sendPasswordResetEmail(email: user!.email);
      UIHelper.showSuccessDialog(ctx, 'Reset link sent',
          'A password reset link has been sent to your email ${user!.email}. Please follow the instructions in the email to reset your password.');
    } catch (e) {
      UIHelper.showErrorDialog(ctx, 'Error!', e.toString());
    }
  }

  Future<void> updateUser({
    String? name,
    String? university,
    String? email,
    String? imageUrl,
    String? password,
  }) async {
    final url = Uri.parse(nodeServerBaseUrl + '/api/user/update');
    String authToken = (await _auth.currentUser!.getIdToken());
    Map<String, dynamic> body = {
      'authToken': authToken,
      'email': email,
      'name': name,
      'university': university,
      'imageURL': imageUrl,
      'password': password,
    };
    //Remove null from body
    body.removeWhere((key, value) => value == null);
    try {
      final response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        user = _TedXUser.fromMap(json.decode(response.body));
        await _auth.currentUser!.reload();
        notifyListeners();
      } else {
        throw Exception(
            'Failed to update user, ${json.decode(response.body)['msg']}');
      }
    } catch (e) {
      print('throwing');
      throw Exception('Failed to update user, $e');
    }
  }
}

//TODO: Add tickets, trivia,etc.
class _TedXUser {
  String university;
  String imageUrl;
  final FirebaseAuth _auth;
  String get email => _auth.currentUser!.email!;
  String get name => _auth.currentUser!.displayName!;
  // String get imageURL => _auth.currentUser!.photoURL!;
  _TedXUser({
    required this.university,
    required this.imageUrl,
  }) : _auth = FirebaseAuth.instance;

  factory _TedXUser.fromMap(Map<String, dynamic> map) {
    return _TedXUser(
      university: map['university'] as String,
      imageUrl: map['imageURL'] as String,
    );
  }
}
