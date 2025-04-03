import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class XNetworkImage extends StatelessWidget {
  final String url;
  Widget? errorWidget;
  BoxFit? fit;
  double? width;
  double? height;
  XNetworkImage({super.key, required this.url, this.errorWidget, this.fit, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: url,
      fit: fit,
      width: width,
      height: height,
      errorWidget: (context, string, error){
          return errorWidget ?? const Center(child: Icon(Icons.error));
          // return errorWidget ?? const Center(child: Text("error"),);
      },
      placeholder: (context, string){
          return const AspectRatio(aspectRatio: 9.0,
            child: Center(child: CupertinoActivityIndicator()),
          );
      },
    );
  }
}
