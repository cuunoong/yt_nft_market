import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_market/presentation/pages/discover_page.dart';
import 'package:nft_market/presentation/pages/sign_in_page.dart';
import 'package:nft_market/presentation/widgets/button_widget.dart';
import 'package:nft_market/presentation/widgets/input_widget.dart';
import 'package:nft_market/presentation/widgets/page_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _body(),

              // Sign in
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ));
                },
                child: Text(
                  'Sign In to My Account',
                  style: GoogleFonts.inter(
                      color: const Color(0xFF909FB4), fontSize: 16),
                ),
              )
            ]),
      ),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Column(children: [
        // Title
        const Gap(60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Start Collecting Amazing Artworks',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                color: const Color(0xFF0D1220),
                fontSize: 26,
                fontWeight: FontWeight.w600,
                height: 36 / 26),
          ),
        ),
        const Gap(40),

        // Form
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(24)),
          child: Column(children: [
            const InputWidget(
              lable: 'Full Name',
            ),
            const InputWidget(
              lable: 'Email',
            ),
            const InputWidget(
              lable: 'Password',
              isPassword: true,
            ),

            // Action
            const Gap(10),
            Builder(builder: (context) {
              return ButtonWidget(
                text: 'Continue',
                isFullWidth: true,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const DiscoverPage(),
                  ));
                },
              );
            })
          ]),
        )
      ]),
    );
  }
}
