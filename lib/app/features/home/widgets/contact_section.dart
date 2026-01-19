import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contact_info_tile.dart';

class ContactSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final bool isMobile;

  const ContactSection({
    super.key,
    required this.sectionKey,
    required this.isMobile,
  });

  // URL লঞ্চ করার ফাংশন
  Future<void> _launch(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        debugPrint("Could not launch $url");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 80.h,
        horizontal: isMobile ? 20.w : 100.w,
      ),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.02),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.03))),
      ),
      child: Column(
        children: [
          // Section Title
          Text(
            "Get In Touch",
            style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Container(width: 50.w, height: 4.h, color: Colors.blueAccent),
          SizedBox(height: 60.h),

          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Contact Details - Left Side
              Column(
                crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                children: [
                  _clickableTile(
                    onTap: () => _launch('mailto:masumrna927@gmail.com'),
                    child: const ContactInfoTile(
                      icon: Icons.alternate_email_rounded,
                      label: "Email Me",
                      value: "masumrna927@gmail.com",
                    ),
                  ),
                  _clickableTile(
                    onTap: () => _launch('tel:+8801731090564'),
                    child: const ContactInfoTile(
                      icon: Icons.phone_iphone_rounded,
                      label: "Call Me",
                      value: "+880 1731090564",
                    ),
                  ),
                  _clickableTile(
                    onTap: () => _launch('https://www.google.com/maps/search/?api=1&query=Pollobi+B+Block+Section+12+Dhaka'),
                    child: const ContactInfoTile(
                      icon: Icons.location_on_rounded,
                      label: "Location",
                      value: "Pollobi, Section 12, Dhaka",
                    ),
                  ),
                ],
              ),

              if (!isMobile) SizedBox(width: 80.w),
              if (isMobile) SizedBox(height: 50.h),

              // CTA Button - Right Side
              Column(
                children: [
                  Text(
                    "Have a project in mind?",
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 25.h),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                      elevation: 10,
                      shadowColor: Colors.blueAccent.withOpacity(0.4),
                    ),
                    onPressed: () => _launch('mailto:masumrna927@gmail.com?subject=Project Inquiry'),
                    icon: const Icon(Icons.send_rounded, color: Colors.white),
                    label: Text(
                      "Let's Build Something",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // GestureDetector Wrapper for Clean Code
  Widget _clickableTile({required VoidCallback onTap, required Widget child}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}