import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../business_logic/authentication/cubits.dart';
import '../../../../../constants/enums/auth_process_status.dart';
import '../../../../../constants/enums/fields.dart';
import '../../../../../data/models/auth/custom_error.dart';
import '../../components/text_field.dart';
import '../../widgets/loading.dart';
import '../../../../../../constants/constants.dart';
import '../../components/error_dialog.dart';
import 'forgot_password.dart';
import 'package:validators/validators.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key, this.isSignIn = true}) : super(key: key);
  final bool isSignIn;
  static const routeName = '/authenticate';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isObscured = true;
  bool signInState = true;
  bool isProcessing = false;

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
    Navigator.of(context).pushNamed(ForgotPasswordScreen.routeName);
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
    if (signInState) {
      context.read<SignInCubit>().signIn(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
    } else {
      context.read<SignUpCubit>().signUp(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            phone: phoneController.text.trim(),
          );
    }
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
          child: MultiBlocListener(
            listeners: [
              // signin blocListener
              BlocListener<SignInCubit, SignInState>(
                  listener: (context, state) {
                if (state.signInStatus == AuthProcessStatus.error) {
                  setState(() {
                    isProcessing = false;
                  });
                  errorDialog(context: context, error: state.error);
                } else if (state.signInStatus == AuthProcessStatus.loading) {
                  setState(() {
                    isProcessing = true;
                  });
                }
              }),

              // signup blocListener
              BlocListener<SignUpCubit, SignUpState>(
                  listener: (context, state) {
                if (state.signUpStatus == AuthProcessStatus.error) {
                  setState(() {
                    isProcessing = false;
                  });
                  errorDialog(context: context, error: state.error);
                } else if (state.signUpStatus == AuthProcessStatus.loading) {
                  setState(() {
                    isProcessing = true;
                  });
                }
              })
            ],
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
                !isProcessing
                    ? Form(
                        autovalidateMode: autoValidateMode,
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              signInState
                                  ? const SizedBox.shrink()
                                  : KTextField(
                                      controller: fullNameController,
                                      hintText: 'Enter Fullname',
                                      label: 'Fullname',
                                      field: Field.fullname,
                                    ),
                              const SizedBox(height: 10),
                              KTextField(
                                controller: emailController,
                                hintText: 'Enter Email',
                                label: 'Email Address',
                                field: Field.email,
                              ),
                              const SizedBox(height: 10),
                              signInState
                                  ? const SizedBox.shrink()
                                  : KTextField(
                                      controller: phoneController,
                                      hintText: 'Enter Phone Number',
                                      label: 'Phone Number',
                                      field: Field.phone,
                                    ),
                              const SizedBox(height: 10),
                              KTextField(
                                  controller: passwordController,
                                  hintText: 'Enter Password',
                                  label: 'Password',
                                  field: Field.password,
                                  isObscured: isObscured),
                              const SizedBox(height: 10),
                              kElevatedButton(
                                action: submitFnc,
                                labelChild:
                                    Text(signInState ? 'Signin' : 'Signup'),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  kTextButton(
                                      title: 'Forgot Password?',
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
                    : const LoadingWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
