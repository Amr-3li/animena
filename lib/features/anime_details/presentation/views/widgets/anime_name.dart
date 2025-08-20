import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeInformationName extends StatelessWidget {
  const AnimeInformationName({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0, 8, 31, 8),
      width: 130.w,
      height: 60.h,
      child: Expanded(
        child: Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: Colors.white,
                  letterSpacing: .5,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
