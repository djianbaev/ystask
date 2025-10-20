import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ystask/widgets/task_card.dart';

class ProfileHotTasks extends StatefulWidget {
  final bool isExpanded;
  const ProfileHotTasks({super.key, required this.isExpanded});

  @override
  State<ProfileHotTasks> createState() => _ProfileHotTasksState();
}

class _ProfileHotTasksState extends State<ProfileHotTasks> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  @override
  void didUpdateWidget(covariant ProfileHotTasks oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isExpanded != widget.isExpanded) {
      setState(() {
        _isExpanded = widget.isExpanded;
      });
    }
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h, left: 16.w),
      // padding: EdgeInsets.only(left: 8.w, top: 8.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF17B2C),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          bottomLeft: Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: _toggleExpanded,
            child: Container(
              height: 38.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    "Hot Tasks",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  if(!_isExpanded)
                  ElevatedButton(
                    onPressed: _toggleExpanded,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.w, vertical: 4.h),
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "View all",
                          style: TextStyle(
                              color: const Color(0xFFF17B2C),
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: const Color(0xFFF17B2C),
                          size: 14.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: _isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Container(
              height: 260.h,
              padding: EdgeInsets.only(left: 8.w, bottom: 8.h),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const TaskCard(
                    time: "11:55",
                    deadline: "Before 25 June",
                    responses: "10 Responses",
                    payment: "150 AED",
                  ),
                  SizedBox(width: 8.w),
                  const TaskCard(
                    time: "11:55",
                    deadline: "Before 25 June",
                    responses: "10 Responses",
                    payment: "150 AED",
                  ),
                ],
              ),
            ),
            secondChild: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
