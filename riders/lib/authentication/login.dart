import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riders/global/global.dart';
import 'package:riders/mainScreens/home_screen.dart';
import 'package:riders/widgets/custom_text_field.dart';
import 'package:riders/widgets/error_dialog.dart';
import 'package:riders/widgets/loading_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  formValidation() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      loginNow();
    } else {
      showDialog(
          context: context,
          builder: (c) {
            return const ErrorDialog(message: "Please enter email and password.");
          });
    }
  }

  void loginNow() async {
    showDialog(
        context: context,
        builder: (c) {
          return const LoadingDialog(message: "Validating Credentials.");
        });

    User? currentUser;
    await firebaseAuth
        .signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim())
        .then((auth) => {currentUser = auth.user})
        .catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(message: error.message.toString());
          });
    });

    if (currentUser != null) {
      readDataAndSetLocalData(currentUser!);
    }
  }

  Future<void> readDataAndSetLocalData(User currentUser) async {
    await FirebaseFirestore.instance.collection("riders").doc(currentUser.uid).get().then((snapshot) async {
      if (snapshot.exists) {
        await sharedPreferences!.setString("uid", currentUser.uid);
        await sharedPreferences!.setString("email", snapshot.data()!["riderEmail"]);
        await sharedPreferences!.setString("name", snapshot.data()!["riderName"]);
        await sharedPreferences!.setString("photoUrl", snapshot.data()!["riderAvatarUrl"]);
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (c) => const HomeScreen()));
      } else {
        await firebaseAuth.signOut();
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (c) => const LoginScreen()));

        showDialog(
            context: context,
            builder: (c) {
              return const ErrorDialog(message: "Account not registered as a rider");
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                "images/signup.png",
                height: 170,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  data: Icons.email,
                  controller: emailController,
                  hintText: "Email",
                  isObscure: false,
                ),
                CustomTextField(
                  data: Icons.lock,
                  controller: passwordController,
                  hintText: "Password",
                  isObscure: true,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              formValidation();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan, padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            child: const Text(
              "Log In",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
