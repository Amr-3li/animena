import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimeNumInformation extends StatelessWidget {
  const AnimeNumInformation(
      {super.key, required this.text, required this.name, required this.icon});
  final String? text, name;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(200, 94, 107, 92),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 100.w,
      height: 120.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          icon!,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            text!,
            style: TextStyle(fontSize: 15.sp, color: Colors.white),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            name!,
            style: TextStyle(
                fontSize: 15.sp,
                color: const Color.fromARGB(200, 189, 189, 189)),
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
