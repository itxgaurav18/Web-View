import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MYdart extends StatefulWidget {
  const MYdart({super.key});

  @override
  State<MYdart> createState() => _MYdartState();
}

class _MYdartState extends State<MYdart> {
  double _progress = 0;
  late InAppWebViewController inAppWebViewController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
               url: Uri.parse("https://drive.google.com/file/d/1XM0y-HRvL0zG442j0CvEVLn57C8PO0su/view?usp=drive_link")
            ),
               onWebViewCreated: (InAppWebViewController controller){
               inAppWebViewController = controller;
               },
                 onProgressChanged: (InAppWebViewController controller , int progress){
                  setState(() {
                    _progress = progress / 100;
                  });

                 },
          )
          ,          _progress < 1 ? Container(
            child: LinearProgressIndicator(
               value: _progress,
            ),
          ):SizedBox()
        ],
      ),

    );
  }
}
