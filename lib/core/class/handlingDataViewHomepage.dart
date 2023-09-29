//
// import 'package:snapenotess/core/class/statusrequest.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// import '../constant/imageassets.dart';
//
//
// class HandlingDataViewHomePage extends StatelessWidget {
//   final StatusRequest statusRequest;
//   final Widget widget;
//   final Widget loadingWidget;
//   const HandlingDataViewHomePage(
//       {Key? key, required this.statusRequest, required this.widget, required this.loadingWidget})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == StatusRequest.loading
//         ?
//         loadingWidget
//         : statusRequest == StatusRequest.offlinefailure
//         ? Center(
//         child: Lottie.asset(AppImageAsset.offline,
//             width: 150, height: 150))
//         : statusRequest == StatusRequest.serverfailure
//         ? Center(
//         child: Lottie.asset(AppImageAsset.server,
//             width: 150, height: 150))
//         : statusRequest == StatusRequest.failure
//         ? Center(
//         child: Lottie.asset(AppImageAsset.nodata,
//             width: 150, height: 150, repeat: true))
//         : widget;
//   }
// }