import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:programming_stars/src/constant/app_color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.flexible = false,
      this.isLoading = false,
      this.color = AppColors.primaryColor,
      this.titleColor = Colors.white,
      this.svgIcon = "",
      this.width,
      this.height})
      : super(key: key);
  final String title;
  final bool flexible;
  final VoidCallback onTap;
  final bool isLoading;
  final Color color;
  final Color titleColor;
  final String svgIcon;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      height: height ?? Get.height * 0.06,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: isLoading ? null : onTap,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: AppColors.white,
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (svgIcon.isNotEmpty) ...[
                      SvgPicture.asset(
                        svgIcon,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
