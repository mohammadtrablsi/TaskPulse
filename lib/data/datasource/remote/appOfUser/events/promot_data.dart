// import 'package:get/get.dart';
//
// import '../../../../../core/class/crud.dart';
// import '../../../../../linkapi.dart';
//
//
//
//
//
//
//
// class PromoteData {
//   Crud crud;
//   PromoteData(this.crud);
//   var eventId;
//   var promationId=1;
//   var type;
//   var numberOfHourse;
//   getsubcatigoriesdata(token) async {
//     var response = await crud.promot("${AppLink.promot}/$promationId/$eventId/$type?hours=$numberOfHourse", {}, {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token'
//     });
//     return response.fold((l) => l, (r) => r);
//   }
// }
