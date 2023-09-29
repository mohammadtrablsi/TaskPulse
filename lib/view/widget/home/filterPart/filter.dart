import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../filterPart/itemOfFilter.dart';





class FilterPart extends StatelessWidget {
  const FilterPart({super.key,required this.numberOfAll,required this.numberOfProccessing,required this.numberOfDone, required this.filterId, required this.onTap1, required this.onTap2, required this.onTap3});

  final numberOfAll;
  final numberOfProccessing;
  final numberOfDone;
  final int filterId;
  final void Function()? onTap1;
  final void Function()? onTap2;
  final void Function()? onTap3;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:5.w),
      child: Row(children: [
        ItemOfFilter(text: 'All', number: numberOfAll, filterId: filterId,Id:1, onTap: onTap1,),
        const Spacer(),
        ItemOfFilter(text: 'proccessing', number: numberOfProccessing,filterId: filterId,Id:2,onTap:onTap2),
        const Spacer(),
        ItemOfFilter(text: 'done', number: numberOfDone,filterId: filterId,Id:3,onTap:onTap3),
      ],),
    );
  }
}
