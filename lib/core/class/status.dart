// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// import '../constant/imageassets.dart';
//
// class status extends StatelessWidget {
//   const status({super.key, required this.statuses, required this.widget});
//   final String statuses;
//   final Widget widget;
//
//   @override
//   Widget build(BuildContext context) {
//     return statuses == "loading"
//         ? Center(child: Lottie.asset(AppImageAsset.loading, width: 180, height: 180))
//         : statuses == "offline"
//             ? Center(
//                 child: Lottie.asset(AppImageAsset.offline, width: 180, height: 180))
//             : statuses == "error server"
//                 ? Center(
//                     child:
//                         Lottie.asset(AppImageAsset.server, width: 180, height: 180))
//                 : widget;
//   }
// }