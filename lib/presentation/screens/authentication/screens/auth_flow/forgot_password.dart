import 'package:flutter/material.dart';
import '../../widgets/loading.dart';
import 'retrieve_password.dart';
import '../../../../../../constants/constants.dart';
import 'auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forgotpassword';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool isProcessing = false;

  // textField
  Widget kTextField({
    required TextEditingController controller,
    required String hintText,
    required String label,
  }) {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty ||
            !value.contains('@') ||
            !value.contains('.com') ||
            value.length < 6) {
          return '$label needs to be valid';
        }

        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(label),
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
    Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
  }

  // text button
  Widget kTextButton({
    required String title,
    required Function(bool isSignin) action,
  }) {
    return TextButton(
      onPressed: () => action,
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
    // todo handle forgot password
    Navigator.of(context)
        .pushReplacementNamed(RetrievePasswordScreen.routeName);
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
                'Forgot Password',
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
                              controller: emailController,
                              hintText: 'Enter Email',
                              label: 'Email Address',
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
                                    'Remembered password? Sign in',
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
