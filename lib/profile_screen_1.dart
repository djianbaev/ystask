import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ystask/widgets/profile_header.dart';
import 'package:ystask/widgets/profile_header_min.dart';
import 'package:ystask/widgets/profile_hot_tasks.dart';
import 'package:ystask/widgets/profile_last_order.dart';
import 'package:ystask/widgets/profile_portfolio_status.dart';
import 'package:ystask/widgets/profile_sort.dart';
import 'package:ystask/widgets/profile_stories.dart';
import 'package:ystask/widgets/profile_task.dart';

class ProfileScreen1 extends StatefulWidget {
  const ProfileScreen1({super.key});

  @override
  State<ProfileScreen1> createState() => _ProfileScreen1State();
}


class _ProfileScreen1State extends State<ProfileScreen1> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _lastOrderKey = GlobalKey();
  final GlobalKey _hotTasksKey = GlobalKey();
  final GlobalKey _sortsKey = GlobalKey();
  bool _showStickyHeader = false;
  bool _expandHotTasks = true;
  bool _stickHotTasks = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final lastOrderBox = _lastOrderKey.currentContext?.findRenderObject() as RenderBox?;
    if (lastOrderBox != null) {
      final position = lastOrderBox.localToGlobal(Offset.zero);
      final height = lastOrderBox.size.height;
      final middleY = position.dy + height / 2;
      final shouldShow = middleY <= kToolbarHeight;
      if (shouldShow != _showStickyHeader) {
        setState(() {
          _showStickyHeader = shouldShow;
        });
      }
    }
    final hotTasksBox = _hotTasksKey.currentContext?.findRenderObject() as RenderBox?;
    final sortBox = _sortsKey.currentContext?.findRenderObject() as RenderBox?;

    if(hotTasksBox != null && sortBox != null){
      final hotTasksPosition = hotTasksBox.localToGlobal(Offset.zero);
      final sortPosition = sortBox.localToGlobal(Offset.zero);
      final sortHeight = sortBox.size.height;

      final sortBottom = sortPosition.dy + sortHeight;
      final hotTasksTop = hotTasksPosition.dy;

      final shouldCollapse = hotTasksTop <= sortBottom;

      if (shouldCollapse != !_expandHotTasks) {
        setState(() {
          _expandHotTasks = !shouldCollapse;
        });
      }

      final shouldStick = hotTasksTop <= (kToolbarHeight + sortHeight);

      if (shouldStick != _stickHotTasks) {
        setState(() {
          _stickHotTasks = shouldStick;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  pinned: false,
                  expandedHeight: kToolbarHeight,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ProfileHeader(),
                  ),
                ),

                SliverToBoxAdapter(child: ProfileStories()),
                SliverToBoxAdapter(child: ProfilePortfolioStatus()),
                SliverToBoxAdapter(child: ProfileLastOrder(key: _lastOrderKey)),
                SliverToBoxAdapter(child: ProfileHotTasks(key: _hotTasksKey,isExpanded: _expandHotTasks,)),
                // SliverPersistentHeader(
                //   pinned: true,
                //   delegate: _HotTasksHeaderDelegate(
                //     builder: (isExpanded) {
                //       return ProfileHotTasks(isExpanded: isExpanded);
                //     },
                //   ),
                // ),
                ProfileTasks(),
              ],
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: _showStickyHeader
                    ? Container(
                  key: const ValueKey("header"),
                  height: kToolbarHeight,
                  color: Colors.white,
                  child: const ProfileHeaderMin(),
                )
                    : const SizedBox.shrink(key: ValueKey("empty-header")),
              ),
            ),
            Positioned(
              top: _showStickyHeader ? kToolbarHeight : -kToolbarHeight,
              left: 0,
              right: 0,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: _showStickyHeader
                    ? Container(
                  color: const Color(0xFFF6F8FA),
                  child: ProfileSort(key: _sortsKey),
                )
                    : const SizedBox.shrink(key: ValueKey("empty-sort")),
              ),
            ),
            // Positioned(
            //   top: _showStickyHeader ? kToolbarHeight + 28.h : 0, // 28.h - высота ProfileSort
            //   left: 0,
            //   right: 0,
            //   child: AnimatedSwitcher(
            //     duration: const Duration(milliseconds: 300),
            //     transitionBuilder: (child, animation) =>
            //         FadeTransition(opacity: animation, child: child),
            //     child: _stickHotTasks
            //         ? Container(
            //       key: const ValueKey("sticky-hot-tasks"),
            //       child: ProfileHotTasks(
            //         isExpanded: false, // В закрепленном состоянии всегда свернут
            //       ),
            //     )
            //         : const SizedBox.shrink(key: ValueKey("empty-hot-tasks")),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}