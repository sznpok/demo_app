import 'package:demo_app/constant/values.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class PopupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PopupPageState();
  }

  final String? _url;
  PopupPage(this._url);

  getUrl() {
    //print("External WebView Url" + _url!);
    return _url;
  }
}

class PopupPageState extends State<PopupPage> {
  final Completer<WebViewController>? _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''), // If needed we can display title
        leading: new Container(),
        actions: <Widget>[
          IconButton(
            iconSize: PADDING * 3,
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      ),
      body: WebView(
          initialUrl: widget.getUrl(),
          javascriptMode: JavascriptMode.unrestricted),
    );
  }
}
