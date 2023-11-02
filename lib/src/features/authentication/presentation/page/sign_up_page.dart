import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:programming_stars/src/common/common_widget.dart';
import 'package:programming_stars/src/common/primary_button.dart';
import 'package:programming_stars/src/common/primary_text_field.dart';
import 'package:programming_stars/src/constant/app_assets.dart';
import 'package:programming_stars/src/constant/app_color.dart';
import 'package:programming_stars/src/constant/style.dart';
import 'package:programming_stars/src/features/authentication/presentation/bloc/signUpBloc/bloc/sign_up_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccessState) {
                customSnakbar(
                  title: "Success",
                  message: "User sign up successfully",
                );
              } else {
                customSnakbar(
                    title: "Error",
                    message: "Internal server error",
                    isError: true);
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Image.asset(
                    AppAssets.SPLASH_IMAGE,
                    height: Get.height * 0.2,
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  StreamBuilder<String>(
                      stream: context.read<SignUpBloc>().firstNameStream,
                      builder: (context, snapshot) {
                        return PrimaryTextField(
                          controller: _firstNameController,
                          textInputType: TextInputType.text,
                          errorText: snapshot.error as String?,
                          onChanged: (value) {
                            context.read<SignUpBloc>().updateName(value);
                            return;
                          },
                          hintText: "First name",
                          labelText: "John",
                          validator: null,
                        );
                      }),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  StreamBuilder<String>(
                      stream: context.read<SignUpBloc>().lastNameStream,
                      builder: (context, snapshot) {
                        return PrimaryTextField(
                          controller: _lastNameController,
                          textInputType: TextInputType.text,
                          errorText: snapshot.error as String?,
                          onChanged: (value) {
                            context.read<SignUpBloc>().updateLastName(value);
                            return;
                          },
                          hintText: "Last name",
                          labelText: "Doe",
                          validator: null,
                        );
                      }),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  StreamBuilder<String>(
                      stream: context.read<SignUpBloc>().emailStream,
                      builder: (context, snapshot) {
                        return PrimaryTextField(
                          controller: _emailController,
                          errorText: snapshot.error as String?,
                          textInputType: TextInputType.text,
                          onChanged: (value) {
                            context.read<SignUpBloc>().updateEmail(value);
                            return;
                          },
                          hintText: "Email address",
                          labelText: "example@gmail.com",
                          validator: null,
                        );
                      }),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  StreamBuilder<String>(
                      stream: context.read<SignUpBloc>().passwordStream,
                      builder: (context, snapshot) {
                        return PrimaryTextField(
                          controller: _passwordController,
                          textInputType: TextInputType.text,
                          isSuffixIcon: true,
                          errorText: snapshot.error as String?,
                          onChanged: (value) {
                            context.read<SignUpBloc>().updatePassword(value);
                            return;
                          },
                          hintText: "Password",
                          labelText: "********",
                          validator: null,
                        );
                      }),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  StreamBuilder<String>(
                      stream: context.read<SignUpBloc>().confirmPasswordStream,
                      builder: (context, snapshot) {
                        return PrimaryTextField(
                          errorText: snapshot.error as String?,
                          controller: _confirmPasswordController,
                          textInputType: TextInputType.text,
                          isSuffixIcon: true,
                          onChanged: (value) {
                            context
                                .read<SignUpBloc>()
                                .updateConfirmPassword(value);
                            return;
                          },
                          hintText: "Confirm password",
                          labelText: "********",
                          validator: null,
                        );
                      }),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  StreamBuilder<bool>(
                      stream: context.read<SignUpBloc>().signUpValid,
                      builder: (context, snapshot) {
                        return PrimaryButton(
                            title: "SIGN UP",
                            onTap: () {
                              if (snapshot.hasData && snapshot.data == true) {
                                // Call your API here for sign up user
                                // Show success message here

                                customSnakbar(
                                  title: "Success",
                                  message: "User sign up successfully",
                                );
                              } else {
                                customSnakbar(
                                    title: "Error",
                                    message: "Please fill all fields",
                                    isError: true);
                                // Show error message here
                              }
                            });
                      }),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account?",
                        style: robotoBold,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login",
                          style: robotoBold.copyWith(
                            color: AppColors.primaryColorDark,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}
