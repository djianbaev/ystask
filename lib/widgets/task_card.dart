import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskCard extends StatelessWidget {
  final String? title;
  final String? description;
  final String? time;
  final String? deadline;
  final String? payment;
  final String? responses;

  const TaskCard({
    super.key,
    this.title,
    this.description,
    this.time,
    this.deadline,
    this.payment,
    this.responses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      padding: const EdgeInsets.all(16),
      height: 250.h,
      width: 300.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          time != null
              ? Row(
            children: [
              Flexible(
                child: Text(
                  "If a cat has 4 lives and 2 birds have 3 lives each, how many lives do they have collectively?",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: 6.h, horizontal: 8.w),
                decoration: BoxDecoration(
                    color: const Color(0xFFF17B2C),
                    borderRadius: BorderRadius.circular(100.r)),
                child: Text(
                  time!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            ],
          )
              : Flexible(
            child: Text(
              "If a cat has 4 lives and 2 birds have 3 lives each, how many lives do they have collectively?",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 8.h),
          Flexible(
            child: Text(
              "Use your math skills to find out how many legs are in total when you have a group of 5 spiders and 3 ants. Remember, each spider has 8 legs and each ant has 6. Multiply the number of creatures by their legs and add the results together. How many legs do they have all together?",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 8.h),
          const Divider(color: Color(0xFFE2E4E9)),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 12.w,
                        color: const Color(0xFF525866),
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        "When",
                        style: TextStyle(
                            color: const Color(0xFF525866), fontSize: 11.sp),
                      )
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    deadline??"Before 25 June",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.money,
                        size: 12.w,
                        color: const Color(0xFF525866),
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        "Safe Payment",
                        style: TextStyle(
                            color: const Color(0xFF525866), fontSize: 11.sp),
                      )
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    payment??"150 AED",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 8.h),
          const Divider(color: Color(0xFFE2E4E9)),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                responses ?? "No Responses",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F87AD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  elevation: 0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.open_in_full_outlined,
                      color: Colors.white,
                      size: 14.w,
                    ),
                    Text(
                      "About Task",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
