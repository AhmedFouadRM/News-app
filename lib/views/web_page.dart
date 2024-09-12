import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Widgets/loading_indecator.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key, required this.url, required this.title});
  final String url;
  final String title;

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  WebViewController controller = WebViewController();
  double webProgress = 0;
  @override
  void initState() {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) => setState(() {
          webProgress = progress / 100;
        }),
      ))
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                controller.reload();
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          LoadingIndecator(
            progress: webProgress,
          ),
          Expanded(child: WebViewWidget(controller: controller)),
        ],
      ),
    );
  }
}
