import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EGiftScreen extends StatefulWidget {
  const EGiftScreen({super.key});

  @override
  State<EGiftScreen> createState() => _EGiftScreenState();
}

class _EGiftScreenState extends State<EGiftScreen> {
  late WebViewController controller;
  double progress = 0.0;
  bool loading = true;

  @override
  initState() {
    super.initState();
    loadUrl();
  }

  loadUrl() async {
    progress = 0.0;
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int pgrs) {
            setState(() => progress = pgrs.toDouble());
            debugPrint(pgrs.toString());
          },
          onPageStarted: (String url) {
            setState(() => loading = false);
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            setState(() => loading = false);
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.bitrefill.com/buy'));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // controller.reload();
    if (loading) {
      return Center(
        child: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      );
    } else {
      return RefreshIndicator(
        onRefresh: () => controller.reload(),
        child: WebViewWidget(
          controller: controller,
        ),
      );
    }
  }
}
