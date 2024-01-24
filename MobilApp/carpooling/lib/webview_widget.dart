import 'package:carpooling/SizeConfig.dart';
import 'package:carpooling/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';

class WebViewWidget extends StatefulWidget {
  final String url;
  const WebViewWidget({required this.url});

  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  @override
  void initState() {
    url = widget.url;

    super.initState();
  }

  bool isLoad = true;
  String url = "";
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: SizeConfig.screenheight,
          width: SizeConfig.screenwidth,
          child: LoadingOverlay(
            isLoading: isLoad,
            progressIndicator: const SpinKitPulse(
              color: Colors.pinkAccent,
              size: 50.0,
            ),
            color: AppColor.realblog,
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(url)),
              onLoadStop: (controller, url) {
                setState(() {
                  isLoad = false;
                });
              },
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  supportZoom: false,
                ),
              ),
              androidOnPermissionRequest: (InAppWebViewController controller,
                  String origin, List<String> resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              onConsoleMessage: (controller, consoleMessage) {
                if (kDebugMode) {
                  print(consoleMessage.message);
                }
                if (consoleMessage.message == "COMPLETED") {
                  Navigator.of(context).pop();
                }
              },
            ),
          )),
    );
  }
}
