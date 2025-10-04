import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ystask/widgets/task_card.dart';

class ProfileHotTasks extends StatelessWidget {
  const ProfileHotTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h, left: 16.w),
      padding: EdgeInsets.only(left: 8.w, top: 8.h,bottom: 8.h),
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
          Padding(
            padding: EdgeInsets.only(left: 8.w, top: 8.h),
            child: Text(
              "Hot Tasks",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 260.h,
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
          )
        ],
      ),
    );
  }
}

