import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewCollection {
  late InAppWebViewController? controller;
  late PullToRefreshController? pullToRefreshController;
  late String url;
  late bool isLoading;
  late String title;
  late bool isCanBack;
  late double progress;
  late bool isError;

  WebViewCollection({
    this.controller,
    this.pullToRefreshController,
    required this.url,
    required this.isLoading,
    required this.title,
    required this.isCanBack,
    required this.progress,
    required this.isError
  });

}