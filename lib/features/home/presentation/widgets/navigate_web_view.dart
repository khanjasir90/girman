import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigateWebView extends StatefulWidget {
  const NavigateWebView({super.key, required this.url, required this.title});

  final String url;
  final String title;

  @override
  State<NavigateWebView> createState() => _NavigateWebViewState();
}

class _NavigateWebViewState extends State<NavigateWebView> {

  bool isLoading = true;

  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
     _controller =  WebViewController();
    _controller..setNavigationDelegate(_navigationDelegate)..loadRequest(Uri.parse(widget.url)); 
  }

   NavigationDelegate get _navigationDelegate {
    return NavigationDelegate(
      onPageStarted: (url) {
        setState(() {
          isLoading = true;
        });
      },
      onPageFinished: (url) {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  void onBackPress() {
    Navigator.pop(context);
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: onBackPress,
          child: const Icon(Icons.arrow_back,),
        ),
        title: Text(widget.title,),
      ),
      body: Center(
        child: isLoading ? const CircularProgressIndicator() : WebViewWidget(controller: _controller),
      ),
    );
  }
}