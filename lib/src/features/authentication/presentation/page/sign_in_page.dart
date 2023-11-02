import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:programming_stars/src/common/common_widget.dart';
import 'package:programming_stars/src/common/primary_button.dart';
import 'package:programming_stars/src/common/primary_text_field.dart';
import 'package:programming_stars/src/constant/app_assets.dart';
import 'package:programming_stars/src/constant/app_color.dart';
import 'package:programming_stars/src/constant/style.dart';
import 'package:programming_stars/src/features/authentication/presentation/bloc/signInBloc/bloc/sign_in_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state is SignInSuccessState) {
                customSnakbar(
                  title: "Success",
                  message: "Sign In successfully",
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
                      stream: context.read<SignInBloc>().emailStream,
                      builder: (context, snapshot) {
                        return PrimaryTextField(
                          controller: _emailController,
                          errorText: snapshot.error as String?,
                          textInputType: TextInputType.text,
                          onChanged: (value) {
                            context.read<SignInBloc>().updateEmail(value);
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
                      stream: context.read<SignInBloc>().passwordStream,
                      builder: (context, snapshot) {
                        return PrimaryTextField(
                          controller: _passwordController,
                          textInputType: TextInputType.text,
                          isSuffixIcon: true,
                          errorText: snapshot.error as String?,
                          onChanged: (value) {
                            context.read<SignInBloc>().updatePassword(value);
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
                  StreamBuilder<bool>(
                      stream: context.read<SignInBloc>().signInButtonStream,
                      builder: (context, snapshot) {
                        return PrimaryButton(
                            title: "SIGN IN",
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
                    height: Get.height * 0.02,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forgot password?",
                        style: robotoBold,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Get help",
                          style: robotoBold.copyWith(
                            color: AppColors.primaryColorDark,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: AppColors.primaryGrayColor,
                          thickness: 0.5,
                          endIndent: 10,
                        ),
                      ),
                      Text("OR", style: robotoBold),
                      const Expanded(
                        child: Divider(
                          color: AppColors.primaryGrayColor,
                          thickness: 0.5,
                          indent: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      Expanded(
                          child: PrimaryButton(
                              height: 40,
                              color: AppColors.secondaryGrayColor,
                              titleColor: AppColors.primaryColorDark,
                              svgIcon: AppAssets.FACEBOOK_ICON_SVG,
                              title: "FaceBook",
                              onTap: () {})),
                      SizedBox(
                        width: Get.width * 0.1,
                      ),
                      Expanded(
                          child: PrimaryButton(
                              height: 40,
                              svgIcon: AppAssets.GOOGLE_ICON_SVG,
                              color: AppColors.secondaryGrayColor,
                              titleColor: AppColors.primaryColorDark,
                              title: "Google",
                              onTap: () {})),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  PrimaryButton(
                    height: 40,
                    width: Get.width * 0.4,
                    svgIcon: AppAssets.APPLE_ICON_SVG,
                    color: AppColors.secondaryGrayColor,
                    titleColor: AppColors.primaryColorDark,
                    title: "Apple",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: Get.height * 0.07,
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
                          Navigator.pushNamed(context, '/SignUpPage');
                        },
                        child: Text(
                          "SIGN UP",
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
