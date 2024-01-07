import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_market/constants/color_constant.dart';

class InputWidget extends StatelessWidget {
  final String lable;
  final bool isPassword;

  const InputWidget({super.key, required this.lable, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style:
              GoogleFonts.inter(fontSize: 16, color: const Color(0xFF0D1220)),
        ),
        const Gap(8),
        TextField(
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: const Color(0xFF0D1220),
            ),
            obscureText: isPassword,
            decoration: InputDecoration(
                fillColor: const Color(0xFFF7F9FC),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: ColorConstant.primary))),
            cursorColor: const Color(0xFF0D1220)),
        const Gap(20),
      ],
    );
  }
}
