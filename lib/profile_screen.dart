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

import 'package:ystask/widgets/profile_task.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ScrollController _scrollController = ScrollController();

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
        child: Container(),
      ),
    );
  }
}