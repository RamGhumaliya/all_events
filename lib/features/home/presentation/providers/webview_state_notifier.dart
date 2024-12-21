import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebViewState {
  final double progress;
  WebViewState({this.progress = 0.0});
}

class WebViewStateNotifier extends StateNotifier<WebViewState> {
  WebViewStateNotifier() : super(WebViewState());

  void updateProgress(double progress) {
    state = WebViewState(progress: progress);
  }
}

final webViewStateProvider =
    StateNotifierProvider<WebViewStateNotifier, WebViewState>(
        (ref) => WebViewStateNotifier());
