// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:path_provider/path_provider.dart';
//
//
// /// for use this func you need update kotlin version and add this line :
// /// defaultConfig {
// ///   multiDexEnabled true
// /// and
// /// dependencies {
// ///     implementation "androidx.multidex:multidex:2.0.1"
// class FileDownloader {
//   Future<void> requestDownload({
//     required String url,
//     required BuildContext context,
//   }) async {
//     DownloadDialog loading = DownloadDialog(progressLoading: 0.0);
//     final directory = await getApplicationDocumentsDirectory();
//     loading.show(context);
//     try {
//       await FlutterDownloader.enqueue(
//         url: url,
//         savedDir: directory.path,
//         showNotification: true,
//         saveInPublicStorage: true,
//         openFileFromNotification: false,
//       ).then((value) async {
//         bool waitTask = true;
//         while (waitTask) {
//           String query = "SELECT * FROM task WHERE task_id='" + value! + "'";
//           var _tasks = await FlutterDownloader.loadTasksWithRawQuery(query: query);
//           int taskProgress = _tasks![0].progress;
//           loading.updateLoading(taskProgress);
//           if (taskProgress == 100) {
//             Navigator.of(context, rootNavigator: true).pop(true);
//             waitTask = false;
//           }
//         }
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
// }
//
// class DownloadDialog {
//   double progressLoading = 0;
//   late StateSetter _downloadSetState;
//
//   DownloadDialog({
//     required this.progressLoading,
//   });
//
//   void updateLoading(int taskProgress) {
//     _downloadSetState(() {
//       progressLoading = taskProgress.toDouble();
//     });
//   }
//
//   void show(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//             builder: (BuildContext context, StateSetter setModalState) {
//           this._downloadSetState = setModalState;
//           return AlertDialog(
//             content: Container(
//               padding: EdgeInsets.all(2.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Container(
//                     height: 35,
//                     width: 250,
//                     alignment: Alignment.center,
//                     child: Text(
//                       "Downloading",
//                       style: TextStyle(
//                         fontSize: 25.0,
//                         color: Colors.blueAccent,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       // overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(height: 20.0),
//                   Container(
//                     height: 6.5,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                     ),
//                     child: LinearProgressIndicator(
//                       minHeight: 100,
//                       value: progressLoading / 100.0,
//                       valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
//                       backgroundColor: Colors.blueAccent.withOpacity(0.3),
//                     ),
//                   ),
//                   SizedBox(height: 5.0),
//                 ],
//               ),
//             ),
//           );
//         });
//       },
//     );
//   }
// }
