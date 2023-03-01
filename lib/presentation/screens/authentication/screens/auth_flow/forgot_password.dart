import 'package:flutter/material.dart';
import '../../../../../constants/enums/fields.dart';
import '../../components/text_field.dart';
import '../../widgets/loading.dart';
import 'retrieve_password.dart';
import '../../../../../../constants/constants.dart';
import 'auth.dart';
import 'package:validators/validators.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forgotpassword';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  bool isProcessing = false;



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
                autovalidateMode: autoValidateMode,
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            KTextField(
                              controller: emailController,
                              hintText: 'Enter Email',
                              label: 'Email Address',
                              field: Field.email,
                              prefixIcon: Icons.email,
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
