import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:path_provider/path_provider.dart';

class WebsiteView extends StatefulWidget {
  const WebsiteView({
    Key? key,
    this.goToHome,
    this.loadingLogo,
  }) : super(key: key);
  static const routeName = '/website-view';
  final Function? goToHome;

  ///This is shown below the loading indicator
  final Widget? loadingLogo;
  @override
  _WebsiteViewState createState() => _WebsiteViewState();
}

class _WebsiteViewState extends State<WebsiteView> {
  bool _canGoBack = false;
  String _title = 'TED Official Website';
  bool _canGoForward = true;
  double _progress = 0.0;
  InAppWebViewController? _controller;
  bool _isInit = true;
  String url = 'https://www.ted.com/';

  Widget _buttonBarRow() {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: _canGoBack
                ? () {
                    _controller?.goBack();
                  }
                : null,
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward,
            ),
            onPressed: _canGoForward
                ? () {
                    _controller?.goForward();
                  }
                : null,
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            tooltip: 'Copy link',
            icon: const Icon(Icons.link),
            onPressed: () {
              print("copied link");
              Clipboard.setData(ClipboardData(text: url));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  // behavior: SnackBarBehavior.,
                  content: const Text('Link copied to clipboard',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  duration: const Duration(milliseconds: 1500),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // padding: const EdgeInsets.all(10),
                  // margin: const EdgeInsets.all(10).copyWith(bottom: 50),
                  backgroundColor: Colors.black87,
                ),
              );
            },
          ),
          IconButton(
            tooltip: 'Open in browser',
            icon: const Icon(Icons.language),
            onPressed: () {
              launcher.launch(url);
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _controller?.reload();
            },
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      var args = ModalRoute.of(context)?.settings.arguments;
      if (args is Map) {
        url = args['url'];
        return;
      }
      if (args != null) {
        url = args.toString();
      } else {
        url = url;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: InAppWebView(
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        useOnDownloadStart: true,
                        cacheEnabled: false,
                        clearCache: true,
                      ),
                    ),
                    onTitleChanged: (_, title) async {
                      if (_controller != null) {
                        _canGoBack = await _controller!.canGoBack();
                        _canGoForward = await _controller!.canGoForward();
                      }
                      setState(() {
                        _title = title ?? _title;
                      });
                    },
                    onWebViewCreated: (controller) {
                      _controller = controller;
                    },
                    initialUrlRequest: URLRequest(
                      url: Uri.parse(url),
                    ),
                    onProgressChanged: (_, progress) {
                      setState(() {
                        _progress = progress / 100.0;
                      });
                    },
                  ),
                ),
                _buttonBarRow(),
              ],
            ),
            if (_progress != 1.0)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    if (widget.loadingLogo != null) widget.loadingLogo!,
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
