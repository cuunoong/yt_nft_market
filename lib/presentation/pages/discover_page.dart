import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_market/constants/color_constant.dart';
import 'package:nft_market/presentation/widgets/bid_tile_widget.dart';
import 'package:nft_market/presentation/widgets/browse_tile.widget.dart';
import 'package:nft_market/presentation/widgets/page_widget.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
        bottomNavigationBar: _bottomNavigationBar(),
        child: SingleChildScrollView(
          child: Column(
            children: [_userInfo(), _popularBids(), _browse()],
          ),
        ));
  }

  Widget _userInfo() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left
            Row(
              children: [
                // Avatar
                Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: ColorConstant.primary),
                      borderRadius: BorderRadius.circular(60 / 2)),
                  child: Image.asset('assets/images/User1.png'),
                ),
                const Gap(12),

                // Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Arif Iskandar',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: const Color(0xFF0D1220)),
                    ),
                    const Gap(6),
                    Text(
                      'Level 109',
                      style: GoogleFonts.inter(
                          fontSize: 14, color: const Color(0xFF909FB4)),
                    ),
                  ],
                )
              ],
            ),

            CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/svgs/notification.svg')),
            )
          ],
        ),
      );

  Widget _popularBids() {
    var bids = [
      Bid(
          image:
              'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?q=80&w=3328&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: "The Masa",
          ends: "35m 11s",
          price: "12.4"),
      Bid(
          image:
              'https://images.unsplash.com/photo-1643101681441-0c38d714fa14?q=80&w=3432&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: "Centre Power",
          ends: "35m 11s",
          price: "12.4")
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 36),
      child: _listTile(
        title: 'Popular Bids',
        itemHeight: 268,
        itemCount: bids.length,
        itemBuilder: (context, index) => BidTileWidget(
          bid: bids[index],
        ),
      ),
    );
  }

  Widget _browse() {
    var browse = [
      Browse(
          image:
              "https://images.unsplash.com/photo-1636955840493-f43a02bfa064?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          title: "Vector",
          itemCount: 10000),
      Browse(
          image:
              "https://images.unsplash.com/photo-1639548206755-b20081a7cadc?q=80&w=3280&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          title: "3D",
          itemCount: 1232),
      Browse(
          image:
              "https://images.unsplash.com/photo-1664959784172-fafcb579808b?q=80&w=3458&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          title: "Vector",
          itemCount: 12312),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 36),
      child: _listTile(
        title: 'Browse',
        itemHeight: 196,
        itemCount: browse.length,
        itemBuilder: (context, index) => BrowseTileWidget(
          browse: browse[index],
        ),
      ),
    );
  }

  Column _listTile(
      {required String title,
      required double itemHeight,
      required NullableIndexedWidgetBuilder itemBuilder,
      int itemCount = 5}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: const Color(0xFF0D1220)),
          ),
        ),
        const Gap(16),
        SizedBox(
          height: itemHeight,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: itemBuilder,
              separatorBuilder: (context, index) => const Gap(24),
              itemCount: itemCount),
        )
      ],
    );
  }

  Widget _bottomNavigationBar() {
    var menus = ["Discover", "History", "Wishlist", "Setting"];
    var active = 0;

    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 8),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: menus.asMap().entries.map<Widget>((element) {
          return TextButton(
              onPressed: () {},
              child: SizedBox(
                height: 60,
                width: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        'assets/svgs/icon_${element.value.toLowerCase()}.svg'),
                    const Gap(6),
                    Text(
                      element.value,
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: active == element.key
                              ? ColorConstant.primary
                              : const Color(0xFF909FB4)),
                    )
                  ],
                ),
              ));
        }).toList(),
      ),
    );
  }
}
