import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillsSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final bool isMobile;

  const SkillsSection({
    super.key,
    required this.sectionKey,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> skillCategories = [
      {
        'title': 'Programming Languages',
        'icon': Icons.code_rounded,
        'skills': ['Dart (Expert)', 'Kotlin (Expert)', 'Java (Expert)'],
      },
      {
        'title': 'Mobile Development',
        'icon': Icons.phone_android_rounded,
        'skills': [
          'Flutter',
          'Android Native',
          'Platform Channels',
          'Clean Architecture',
          'SOLID Principles',
        ],
      },
      {
        'title': 'State Management',
        'icon': Icons.account_tree_rounded,
        'skills': ['Riverpod', 'Bloc', 'GetX', 'Provider']
      },
      {
        'title': 'Cloud & Database',
        'icon': Icons.cloud_done_rounded,
        'skills': ['Firebase', 'Firestore', 'Auth', 'Analytics', 'Crashlytics']
      },
      {
        'title': 'Payments',
        'icon': Icons.payments_rounded,
        'skills': ['Stripe', 'PayPal', 'SSLCommerz', 'bKash', 'Nagad']
      },
      {
        'title': 'Map & Location',
        'icon': Icons.explore_rounded,
        'skills': ['Google Maps', 'Background Location', 'Geofencing']
      },
      {
        'title': 'Tools & PM',
        'icon': Icons.construction_rounded,
        'skills': ['Git', 'GitHub', 'Jira', 'Asana', 'Notion', 'CI/CD']
      },
    ];

    return Container(
      key: sectionKey,
      padding: EdgeInsets.symmetric(
        vertical: 80.h,
        horizontal: isMobile ? 20.w : 100.w,
      ),
      child: Column(
        children: [
          const SectionTitle(title: "Technical Expertise"),
          SizedBox(height: 50.h),

          // Responsive Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: skillCategories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 25.w,
              mainAxisSpacing: 25.h,
              mainAxisExtent: isMobile ? null : 300.h,
            ),
            itemBuilder: (context, index) {
              return _buildCategoryCard(context, skillCategories[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, Map<String, dynamic> category) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // আইকন এবং টাইটেল সেকশন
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  category['icon'],
                  color: Colors.blueAccent,
                  size: 22.sp,
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Text(
                  category['title'],
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // স্কিল চিপস
          Wrap(
            spacing: 8.w,
            runSpacing: 10.h,
            children: (category['skills'] as List<String>).map((skill) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.blueAccent.withOpacity(0.1)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle_outline_rounded,
                        color: Colors.blueAccent.withOpacity(0.5),
                        size: 12.sp),
                    SizedBox(width: 6.w),
                    Text(
                      skill,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: 50.w,
          height: 4.h,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ],
    );
  }
}