import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Browse {
  final String image;
  final String title;
  final int itemCount;

  Browse({required this.image, required this.title, required this.itemCount});
}

class BrowseTileWidget extends StatelessWidget {
  final Browse browse;

  const BrowseTileWidget({super.key, required this.browse});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 140,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(browse.image).image)),
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
                      browse.title,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: const Color(0xFF0D1220)),
                    ),
                    Text('${browse.itemCount} items',
                        style: GoogleFonts.inter(
                            fontSize: 14, color: const Color(0xFF909FB4)))
                  ],
                ),
              ]),
        )
      ]),
    );
  }
}
