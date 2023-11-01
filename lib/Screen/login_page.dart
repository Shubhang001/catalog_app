import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screen/signup.dart';
import 'package:flutter_application_2/utilis/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCOntroller = TextEditingController();
  TextEditingController usernameCOntroller = TextEditingController();
  TextEditingController passwordCOntroller = TextEditingController();
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  MoveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoutes);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
          child: Column(children: [
        Image.asset(
          "assets/images/login.png",
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Welcome $name",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  controller: usernameCOntroller,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    hintText: "Enter Username",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username cannot be empty";
                    }

                    return null;
                  },
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                ),
                TextFormField(
                  controller: emailCOntroller,
                  decoration: const InputDecoration(
                    labelText: "Email Adress",
                    hintText: "Enter Email",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email cannot be empty";
                    }

                    return null;
                  },
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                ),
                TextFormField(
                  controller: passwordCOntroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Enter Password",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    } else if (value.length < 6) {
                      return "Password should be atleast 6 digits";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeButton ? 40 : 7),
                  child: InkWell(
                    onTap: () => MoveToHome(context),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changeButton ? 50 : 150,
                      height: 40,
                      alignment: Alignment.center,
                      // ignore: sort_child_properties_last
                      child: changeButton
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, MyRoutes.SignupRoutes),
                  child: const Text("Sign Up"),
                )

                /* ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoutes);
                      },
                      // ignore: sort_child_properties_last
                      child: const Text("Login"),
                      style: TextButton.styleFrom(
                        minimumSize: const Size(100, 35),
                      ),
                    ) */
              ])),
        ),
      ])),
    );
  }
}
