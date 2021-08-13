import 'dart:async';

import 'package:demo_app/constant/colors.dart';
import 'package:demo_app/constant/values.dart';
import 'package:demo_app/widgets/header.dart';
import 'package:demo_app/widgets/popup_ex.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final webViewKey = GlobalKey<_WebViewScreenState>();
String selectedUrl = 'https://www.cheers.com.np';

class WebViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WebViewScreenState();
  }
}

class _WebViewScreenState extends State<WebViewScreen> {
  int counter = 5;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: PADDING * 2,
          ),
          Padding(
            padding: const EdgeInsets.all(PADDING),
            child: HeaderAppBar(
              widget: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Web View',
                    style: TextStyle(
                      fontSize: MAIN_TEXT + 8.0,
                      fontWeight: FontWeight.bold,
                      color: BLUE,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  NavigationControls(_controller.future),
                ],
              ),
              backIcon: false,
              profileIcon: false,
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: WebView(
                  initialUrl: selectedUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                  debuggingEnabled: false,
                  navigationDelegate: (NavigationRequest request) {
                    if (!request.url.contains(selectedUrl)) {
                      print(selectedUrl);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PopupPage(request.url)));
                      return NavigationDecision.prevent;
                    }
                    return NavigationDecision.navigate;
                  },
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController>? _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController? controller = snapshot.data;
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: BLUE,
                ),
                onPressed: !webViewReady
                    ? null
                    : () async {
                        if (await controller!.canGoBack()) {
                          controller.goBack();
                        } else {
                          return;
                        }
                      }),
            IconButton(
              icon: const Icon(
                Icons.autorenew,
                color: BLUE,
              ),
              onPressed: !webViewReady
                  ? null
                  : () {
                      controller!.reload();
                    },
            ),
          ],
        );
      },
    );
  }
}
