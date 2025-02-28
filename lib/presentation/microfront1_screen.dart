import 'dart:html' as html;
import 'dart:ui_web';

import 'package:flutter/material.dart';

class Microfrontend1Screen extends StatelessWidget {
  const Microfrontend1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Microfrontends con iFrames")),
        body: Center(
          child: SizedBox(
            width: 800,
            height: 600,
            child: IFrameWidget(
              url: "https://tu-microfrontend.com", // Cambia la URL aquí
            ),
          ),
        ),
      ),
    );
  }
}

class IFrameWidget extends StatelessWidget {
  final String url;

  IFrameWidget({super.key, required this.url}) {
    final uniqueId = url.hashCode.toString(); // ID único para cada iframe
    final html.IFrameElement iframe = html.IFrameElement()
      ..src = url
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%';

    // Registra la vista en Flutter Web
    platformViewRegistry.registerViewFactory(uniqueId, (int viewId) => iframe);

    _iframeId = uniqueId;
  }

  late final String _iframeId;

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _iframeId);
  }
}
