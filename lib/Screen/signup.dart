import 'package:flutter/material.dart';
import 'package:flutter_application_2/utilis/routes.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailCOntroller = TextEditingController();
  TextEditingController usernameCOntroller = TextEditingController();
  TextEditingController passwordCOntroller = TextEditingController();
  TextEditingController cpasswordCOntroller = TextEditingController();
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

  void createAccount() {
    String email = emailCOntroller.text.trim();
    String password = passwordCOntroller.text.trim();
    String cpassword = cpasswordCOntroller.text.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Create an Account"),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
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
                    TextFormField(
                      controller: cpasswordCOntroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Confirm Password",
                        hintText: "Enter Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password should be atleast 6 digits";
                        }
                        /*if (cpasswordCOntroller != passwordCOntroller) {
                          return ("Password does not matches");
                        }*/
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 40 : 7),
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
                  ]),
                ))));
  }
}
