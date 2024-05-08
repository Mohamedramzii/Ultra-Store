import 'package:cloud_firestore/cloud_firestore.dart';

const int animationDuration = 400;
dynamic tokenHolder = '';

//API
const String apiBaseUrl = 'https://api.escuelajs.co';
const String loginEP = '/api/v1/auth/login';
const String getUserInfoEP = '/api/v1/auth/profile';
const String createUserEP = '/api/v1/users/';
const String uploadIMGEP = '/api/v1/files/upload';
CollectionReference<Map<String, dynamic>> usersCollection =
    FirebaseFirestore.instance.collection('users');
