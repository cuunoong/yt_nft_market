import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Bid {
  final String image;
  final String title;
  final String ends;
  final String price;

  Bid(
      {required this.image,
      required this.title,
      required this.ends,
      required this.price});
}

class BidTileWidget extends StatelessWidget {
  final Bid bid;
  const BidTileWidget({super.key, required this.bid});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 270,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: Image.network(bid.image).image)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bid.title,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: const Color(0xFF0D1220)),
                    ),
                    const Gap(8),
                    RichText(
                      text: TextSpan(
                          children: [
                            const TextSpan(text: 'Ends in '),
                            TextSpan(
                                text: bid.ends,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFF86780)))
                          ],
                          style: GoogleFonts.inter(
                              fontSize: 14, color: const Color(0xFF909FB4))),
                    )
                  ],
                ),
                // Spacer(),
                Row(
                  children: [
                    SvgPicture.asset('assets/svgs/bid.svg'),
                    const Gap(4),
                    Text(
                      bid.price,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color(0xFF0D1220)),
                    )
                  ],
                )
              ]),
        )
      ]),
    );
  }
}
