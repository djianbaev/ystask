import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeaderMin extends StatelessWidget {
  const ProfileHeaderMin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: const Color(0xFFF6F8FA),
      child: Row(
        children: [
          GestureDetector(
            child: Icon(Icons.arrow_back),
          ),
          Expanded(
            child: Text(
              "My Categories",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            child: Icon(
              Icons.more_horiz_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
