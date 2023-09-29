// import 'dart:convert';
// import 'dart:io';
// import 'package:dartz/dartz.dart';
// import 'package:path/path.dart';
// // import 'package:http/http.dart' as http;
// import 'package:TaskPulse/core/class/statusrequest.dart';
//
// import '../functions/checkinternet.dart';
//
// class Crud {
//   Future<Either<StatusRequest, Map>> postData(
//       String linkurl, Map data, Map<String, String>? header) async {
//     // if (await checkInternet()) {
//       try {
//         var response =
//             await http.post(Uri.parse(linkurl), body: data, headers: header);
//         print(response.statusCode);
//
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map responsebody = jsonDecode(response.body);
//           print(responsebody);
//
//           return Right(responsebody);
//         } else {
//           return const Left(StatusRequest.failure);
//         }
//       } catch (_) {
//         return const Left(StatusRequest.serverfailure);
//       }
//     // }
//     // else {
//     //   return const Left(StatusRequest.offlinefailure);
//     // }
//   }
//
//   Future<Either<StatusRequest, Map>> postFileAndData(
//       String linkUrl, Map data, File file) async {
//     // if (await checkInternet()) {
//       try {
//         var request = http.MultipartRequest('Post', Uri.parse(linkUrl));
//         int fileLength = await file.length();
//         var streamData = http.ByteStream(file.openRead());
//         var multiFile = http.MultipartFile('image', streamData, fileLength,
//             filename: basename(file.path));
//         request.files.add(multiFile);
//         data.forEach((key, value) {
//           request.fields[key] = value;
//         });
//         var myRequest = await request.send();
//         var response = await http.Response.fromStream(myRequest);
//         if (myRequest.statusCode == 200 || myRequest.statusCode == 201) {
//           Map responsebody = jsonDecode(response.body);
//           print(responsebody);
//           return Right(responsebody);
//         } else {
//           return const Left(StatusRequest.failure);
//         }
//       } catch (_) {
//         return const Left(StatusRequest.serverfailure);
//       }
//     // } else {
//     //   return const Left(StatusRequest.offlinefailure);
//     // }
//   }
//
//   Future<Either<StatusRequest, Map>> getdata(
//       String linkurl, Map data, Map<String, String> header) async {
//     // if (await checkInternet()) {
//       try {
//         var request =
//             await http.Request(
//         'GET', Uri.parse((linkurl),));
//         request.headers.addAll(header);
//         http.StreamedResponse response = await request.send();
//
//         if (response.statusCode == 200 || response.statusCode == 201) {
//         final stream = await response.stream.transform(utf8.decoder);
//           Map data2 =
//           await stream.map((jsonString) => json.decode(jsonString)).first;
//
//           return Right(data2);
//         } else {
//           return const Left(StatusRequest.failure);
//         }
//       } catch (_) {
//         return const Left(StatusRequest.serverfailure);
//       }
//     // } else {
//     //   return const Left(StatusRequest.offlinefailure);
//     // }
//   }
//   Future<Either<StatusRequest, Map>> promot(String linkurl, Map data, Map<String, String> header) async {
//     try {
//     var headers = header;
//     var request = http.MultipartRequest('GET', Uri.parse((linkurl),));
//
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       dynamic ddd=await response.stream.bytesToString();
//       return Right(ddd);
//     }
//     else {
//       return const Left(StatusRequest.failure);
//     }}catch (_) {
//     return const Left(StatusRequest.serverfailure);
//     }
//   }
// }
