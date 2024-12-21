import 'package:all_events/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/webview_state_notifier.dart';

class WebViewScreen extends ConsumerWidget {
  final String url;
  final String title;

  const WebViewScreen({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(webViewStateProvider).progress;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          if (progress < 1.0)
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Theme.of(context).primaryColor,
            ),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(url)),
              onWebViewCreated: (controller) {},
              onProgressChanged: (controller, progressValue) {
                // Update progress via Riverpod
                ref.read(webViewStateProvider.notifier).updateProgress(
                      progressValue / 100,
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
