import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:TaskPulse/core/constant/color.dart';

class ItemOfFilter extends StatelessWidget {
  const ItemOfFilter({super.key, required this.text, required this.number, required this.filterId, required this.Id,required this.onTap});

  final String text;
  final number;
  final int filterId;
  final int Id;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(text),
          SizedBox(
            width: 0.9.w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.05.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: filterId==Id?AppColor.primaryColor:Colors.grey,
            ),
            child: Text(
              number,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
