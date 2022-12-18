import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

// this gets initialized way down in the register screen????
SharedPreferences? sharedPreferences; // = await SharedPreferences.getInstance();

//Used globally
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
