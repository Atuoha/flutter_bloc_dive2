import 'package:flutter/material.dart';
import 'package:flutter_bloc_dive2/presentation/screens/authentication/using_cubit/widgets/loading.dart';
import '../../../../../constants/constants.dart';
import 'auth.dart';
import 'forgot_password.dart';

class RetrievePasswordScreen extends StatefulWidget {
  const RetrievePasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/retrieve_passwrod';

  @override
  State<RetrievePasswordScreen> createState() => _RetrievePasswordScreenState();
}

class _RetrievePasswordScreenState extends State<RetrievePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  bool isObscured = true;
  bool isObscured2 = true;
  bool isProcessing = false;

  @override
  void initState() {
    passwordController.addListener(() {
      setState(() {});
    });

    password2Controller.addListener(() {
      setState(() {});
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
      keyboardType: TextInputType.text,
      textInputAction: controller == password2Controller
          ? TextInputAction.done
          : TextInputAction.next,
      controller: controller,
      obscureText: controller == passwordController ? isObscured : isObscured2,
      validator: (value) {
        if (controller == password2Controller) {
          if (value!.isEmpty || value.length < 8) {
            return '$label needs to be valid!';
          }

          if (value != passwordController.text) {
            return 'Password mismatch!';
          }
        } else {
          if (value!.isEmpty || value.length < 8) {
            return '$label needs to be valid!';
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
                      isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : const SizedBox.shrink()
            : password2Controller.text.isNotEmpty
                ? GestureDetector(
                    onTap: () => setState(() {
                      isObscured2 = !isObscured2;
                    }),
                    child: Icon(
                      isObscured2 ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
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

  void navigateToAuth() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      ),
    );
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
    setState(() {
      isProcessing = true;
    });
    // todo handle password retrieve
    Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/forgot_password.png',
                ),
                radius: 75,
              ),
              const SizedBox(height: 10),
              Text(
                'Retrieve Password',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              !isProcessing
                  ? Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            kTextField(
                              controller: passwordController,
                              hintText: 'Enter Password',
                              label: 'Password',
                            ),
                            const SizedBox(height: 10),
                            kTextField(
                              controller: password2Controller,
                              hintText: 'Enter Confirm Password',
                              label: 'Confirm Password',
                            ),
                            const SizedBox(height: 10),
                            kElevatedButton(
                              action: submitFnc,
                              labelChild: const Text('Submit'),
                              isIconVisible: true,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () => navigateToAuth(),
                                  child: Text(
                                    'Want to cancel? Sign in',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : const LoadingWidget()
            ],
          ),
        ),
      ),
    );
  }
}
