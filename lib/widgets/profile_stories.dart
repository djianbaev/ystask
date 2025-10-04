import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileStories extends StatelessWidget {
  const ProfileStories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h),
      child: SizedBox(
        height: 100.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 175.w,
              height: 90.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: const DecorationImage(
                    image: AssetImage("assets/images/story1.png"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              child: SizedBox(
                width: 80.w,
                height: 90.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.h),
                      child: ClipOval(
                        child: Image.asset(
                          // width: 64.w,
                          // height: 64.w,
                          "assets/images/story2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Flexible(
                      child: Text(
                        "Story headline text",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              child: SizedBox(
                width: 80.w,
                // height: 90.h,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipOval(
                        child: Image.asset(
                          //width: 64.w,
                          // height: 64.w,
                          "assets/images/story3.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Flexible(
                      child: Text(
                        "Become a Trusted Master",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              child: SizedBox(
                width: 80.w,
                // height: 90.h,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipOval(
                        child: Image.asset(
                          //width: 64.w,
                          // height: 64.w,
                          "assets/images/story2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Flexible(
                      child: Text(
                        "Story headline text",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
