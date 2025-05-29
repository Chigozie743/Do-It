// import 'package:liberty_app/constants/utils/exports.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class PrivacyPolicyWebview extends StatefulWidget {
//   const PrivacyPolicyWebview({super.key});

//   @override
//   State<PrivacyPolicyWebview> createState() => _PrivacyPolicyWebviewState();
// }

// class _PrivacyPolicyWebviewState extends State<PrivacyPolicyWebview> {
//   final doItController = WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..setBackgroundColor(const Color(0x00000000))
//     // ..setNavigationDelegate(
//     //   NavigationDelegate(
//     //     onProgress: (int progress) {},
//     //     onPageStarted: (String url) {},
//     //     onPageFinished: (String url) {},
//     //     onWebResourceError: (WebResourceError error) {},
//     //   ),
//     // )
//     ..loadRequest(Uri.parse('https://www.google.com'));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(height: 60.h),
//           Padding(
//             padding: EdgeInsets.only(left: 24.0.w),
//             child: InkWell(
//               onTap: () => Navigator.pop(context),
//               child: Align(
//                 alignment: Alignment.bottomLeft,
//                 child: Container(
//                   height: 20.h,
//                   width: 20.w,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Image.asset(DoItAssetsPath.cancelIcon),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: WebViewWidget(
//               controller: doItController,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
