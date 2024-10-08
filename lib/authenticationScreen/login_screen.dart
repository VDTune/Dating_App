import 'package:dating_app/widgets/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showProgressBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 120),

              Image.asset(
                "images/logo.png",
                width: 150,
              ),

              const SizedBox(height: 20),
              const Text("Welcome", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const Text("Please login now to find your best Match", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

              const SizedBox(height: 28),

              ///Email Text Field
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 60,
                child: CustomTextFieldWidget(
                  editingController: emailTextEditingController,
                  labelText: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(height: 28),

              /// Password Text Field
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 60,
                child: CustomTextFieldWidget(
                  editingController: passwordTextEditingController,
                  labelText: "Password",
                  iconData: Icons.lock_outline,
                  isObscure: true,
                ),
              ),

              const SizedBox(height: 30),

              /// Login Button
              Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: InkWell(
                  onTap: (){},
                  child: const Center(
                    child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              ///Không có tài khoản
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ", style: TextStyle(fontSize: 16, color: Colors.grey,)),
                  InkWell(
                    onTap: (){},
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              showProgressBar == true ?
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                  ) :
                  Container(),

            ],
          ),
        ),
      ),
    );
  }
}