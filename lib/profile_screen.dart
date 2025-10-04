import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ystask/widgets/profile_header.dart';
import 'package:ystask/widgets/profile_header_min.dart';
import 'package:ystask/widgets/profile_hot_tasks.dart';
import 'package:ystask/widgets/profile_last_order.dart';
import 'package:ystask/widgets/profile_portfolio_status.dart';
import 'package:ystask/widgets/profile_sort.dart';
import 'package:ystask/widgets/profile_stories.dart';
import 'package:ystask/widgets/task_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _MySliverHeader(
              minExtent: kToolbarHeight * 2.5,
              maxExtent: 560.h,
            ),
          ),
          SliverToBoxAdapter(child: ProfileHotTasks()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => TaskCard(),
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class _MySliverHeader extends SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;

  _MySliverHeader({required this.minExtent, required this.maxExtent});

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {

    final percent = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    final expandedOpacity = 1 - percent;
    final collapsedOpacity = percent;

    return Container(
      color: const Color(0xFFF6F8FA),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Opacity(
            opacity: expandedOpacity,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: kToolbarHeight * 1.1),
                  ProfileHeader(),
                  ProfileStories(),
                  ProfilePortfolioStatus(),
                  ProfileLastOrder(),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: collapsedOpacity,
            child: Container(
              padding: EdgeInsets.only(top: kToolbarHeight * 1.1),
              child: Column(children: [ProfileHeaderMin(), ProfileSort()]),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}