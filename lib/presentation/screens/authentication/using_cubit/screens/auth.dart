import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key, this.isSignIn = true}) : super(key: key);
  final bool isSignIn;
  static const routeName = '/authenticate';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isObscured = true;
  bool signInState = true;

  @override
  void initState() {
    passwordController.addListener(() {
      setState(() {});
    });
    setState(() {
      signInState = widget.isSignIn;
    });
    super.initState();
  }

  // textField
  Widget kTextField({
    required TextEditingController controller,
    required String hintText,
    required String label,
  }) {
    return TextFormField(
      keyboardType: controller == phoneController
          ? TextInputType.phone
          : TextInputType.text,
      textInputAction: controller == passwordController
          ? TextInputAction.done
          : TextInputAction.next,
      controller: controller,
      obscureText: controller == passwordController ? isObscured : false,
      validator: (value) {
        if (controller == fullNameController) {
          if (value!.isEmpty || value.length < 6) {
            return '$label needs to be valid';
          }
        } else if (controller == phoneController) {
          if (value!.isEmpty || value.length < 11) {
            return '$label needs to be valid';
          }
        } else {
          if (value!.isEmpty || value.length < 8) {
            return '$label needs to be valid';
          }
        }

        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(label),
        suffix: controller == passwordController
            ? passwordController.text.isNotEmpty
                ? GestureDetector(
                    onTap: () => setState(() {
                      isObscured = !isObscured;
                    }),
                    child: Icon(
                      isObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : const SizedBox.shrink()
            : const SizedBox.shrink(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  // elevated button
  Widget kElevatedButton({
    required Widget labelChild,
    required Function action,
    bool isIconVisible = false,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10)),
        onPressed: () => action(),
        icon: isIconVisible
            ? const Icon(Icons.check_circle)
            : const SizedBox.shrink(),
        label: labelChild,
      ),
    );
  }

  // forgot password navigation
  void toForgotPasswordScreen() {
    // todo navigate to forgot password
  }

  // text button
  Widget kTextButton({
    required String title,
    required Function action,
  }) {
    return TextButton(
      onPressed: () => action(),
      child: Text(
        title,
        style: TextStyle(color: primaryColor),
      ),
    );
  }

  // submit function
  void submitFnc() {
    FocusScope.of(context).unfocus();
    var valid = formKey.currentState!.validate();
    if (!valid) {
      return;
    }
    formKey.currentState!.save();
    // todo handle local auth
  }

  // google authenticate
  void authenticate() {
    FocusScope.of(context).unfocus();
    // todo handle google auth
  }

  // toggle isSignIn
  void toggleSign() {
    setState(() {
      signInState = !signInState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  signInState
                      ? 'assets/images/sign_in.png'
                      : 'assets/images/sign_up.png',
                ),
                radius: 75,
              ),
              const SizedBox(height: 10),
              Text(
                signInState ? 'Sign in your account' : 'Sign up account',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      signInState
                          ? const SizedBox.shrink()
                          : kTextField(
                              controller: fullNameController,
                              hintText: 'Enter Fullname',
                              label: 'Fullname',
                            ),
                      const SizedBox(height: 10),
                      kTextField(
                        controller: emailController,
                        hintText: 'Enter Email',
                        label: 'Email Address',
                      ),
                      const SizedBox(height: 10),
                      kTextField(
                        controller: passwordController,
                        hintText: 'Enter Password',
                        label: 'Password',
                      ),
                      const SizedBox(height: 10),
                      kElevatedButton(
                        action: submitFnc,
                        labelChild: Text(signInState ? 'Signin' : 'Signup'),
                        isIconVisible: true,
                      ),
                      const SizedBox(height: 10),
                      kElevatedButton(
                        action: authenticate,
                        labelChild: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(signInState ? 'Signin' : 'Signup'),
                            const SizedBox(width: 7),
                            Image.asset(
                              'assets/images/google.png',
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          kTextButton(
                              title: 'Forgot Password',
                              action: toForgotPasswordScreen),
                          kTextButton(
                              title: signInState
                                  ? 'Don\'t own an account? Signup'
                                  : 'Own a account? Signin',
                              action: toggleSign),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
