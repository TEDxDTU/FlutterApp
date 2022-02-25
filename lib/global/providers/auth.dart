import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      final url = Uri.parse('http://192.168.1.37:3000/api/user/sign-up');
      final ref = FirebaseStorage.instance
          .ref()
          .child('user-images')
          .child(email + '.png');

      await ref.putFile(image, SettableMetadata(contentType: 'image/png'));
      final imageUrl = await ref.getDownloadURL();
      final response = await http.post(url, body: {
        'email': email,
        'password': password,
        'name': name,
        'university': university,
        'imageURL': imageUrl,
      });
      if (response.statusCode == 200) {
        // signIn(email: email, password: password);
      } else {
        Map<String, dynamic> error = jsonDecode(response.body);
        if (error['code'] != 'user_exists') ref.delete();
        throw Exception(error['msg']);
      }
    } on Exception catch (e) {
      print(e);
      throw Exception('Failed to sign up, $e');
    }
  }

  _TedXUser? user;
  bool get isAuth => user != null;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final url = Uri.parse('localhost:3000/api/user/sign-in');
      final response = await http.post(url, body: {
        'email': email,
        'authToken': (await _auth.currentUser!.getIdToken()),
      });
      if (response.statusCode == 200) {
      } else {
        throw Exception(
            'Failed to sign in, ${json.decode(response.body)['msg']}');
      }
    } on Exception catch (e) {
      throw Exception('Failed to sign in, $e');
    }
  }

  // _auth.app
  Future<void> signOut() async {}
}

//TODO: Add tickets, trivia,etc.
class _TedXUser {
  String university;
  final FirebaseAuth _auth;
  String get email => _auth.currentUser!.email!;
  String get name => _auth.currentUser!.displayName!;
  String get imageURL => _auth.currentUser!.photoURL!;
  _TedXUser({
    required this.university,
  }) : _auth = FirebaseAuth.instance;

  factory _TedXUser.fromMap(Map<String, dynamic> map) {
    return _TedXUser(
      university: map['university'] ?? '',
    );
  }
}
