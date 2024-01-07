import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_market/constants/color_constant.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isFullWidth;

  const ButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isFullWidth = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          minimumSize: isFullWidth ? const Size.fromHeight(51) : null,
          backgroundColor: ColorConstant.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      child: Text(
        text,
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
      ),
    );
  }
}
