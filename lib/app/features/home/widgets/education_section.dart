import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final bool isMobile;

  const EducationSection({
    super.key,
    required this.sectionKey,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final educationList = const [
      EducationItem(
        duration: '2023 – Present',
        degree: 'Bachelor of Business Administration (BBA)',
        institution:
        'ZNRF University of Management Sciences (ZUMS), Badda Link Road, Dhaka',
      ),
      EducationItem(
        duration: '2020',
        degree: 'Higher Secondary Certificate (HSC)',
        institution:
        'Pirgonj Government College, Pirgonj, Thakurgaon',
      ),
      EducationItem(
        duration: '2018',
        degree: 'Secondary School Certificate (SSC)',
        institution:
        'Nakati Hat High School, Pirgonj, Thakurgaon',
      ),
    ];

    return Container(
      key: sectionKey,
      padding: EdgeInsets.symmetric(
        vertical: 90.h,
        horizontal: isMobile ? 20.w : 100.w,
      ),
      child: Column(
        children: [
          const SectionTitle(title: 'Education'),
          SizedBox(height: 60.h),

          Column(
            children: educationList
                .map((item) => EducationTimelineCard(item: item))
                .toList(),
          ),
        ],
      ),
    );
  }
}
class EducationItem {
  final String duration;
  final String degree;
  final String institution;

  const EducationItem({
    required this.duration,
    required this.degree,
    required this.institution,
  });
}
class EducationTimelineCard extends StatelessWidget {
  final EducationItem item;

  const EducationTimelineCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 28.h),
      padding: EdgeInsets.all(26.r),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.06),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Timeline Indicator
          Column(
            children: [
              Container(
                width: 14.r,
                height: 14.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                ),
              ),
              Container(
                width: 2.w,
                height: 60.h,
                color: Colors.blueAccent.withValues(alpha: 0.3),
              ),
            ],
          ),
          SizedBox(width: 22.w),

          /// Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.duration,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  item.degree,
                  style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  item.institution,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white70,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 34.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          width: 56.w,
          height: 4.h,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ],
    );
  }
}
