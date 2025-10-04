import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSort extends StatelessWidget {
  const ProfileSort({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          _SortButton(
            label: "My Categories",
            icon: Icons.keyboard_arrow_down,
          ),
          SizedBox(width: 8.w),
          _SortButton(
            label: "Price",
            icon: Icons.filter_list,
          ),
          SizedBox(width: 8.w),
          _SortButton(
            label: "Date",
            icon: Icons.filter_list,
          ),
          SizedBox(width: 8.w),
          _SortButton(
            label: "Responses",
            icon: Icons.filter_list,
          ),
        ],
      ),
    );
  }
}

class _SortButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const _SortButton({
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 4.w),
          Icon(
            icon,
            size: 16.w,
          ),
        ],
      ),
    );
  }
}

