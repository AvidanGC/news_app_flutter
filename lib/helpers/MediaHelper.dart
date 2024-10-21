
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MediaHelper {

  static CachedNetworkImage cachedNetworkImage(String imageUrl, {BoxFit? fit, bool showProgress = false}){
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) => Opacity(
        opacity: 0.8,
        child: showProgress ? const SizedBox(
          height: 20,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ) : null,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
  
}
