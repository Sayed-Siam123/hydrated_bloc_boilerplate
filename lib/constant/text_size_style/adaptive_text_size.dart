import 'package:flutter/material.dart';

double heightPx({height,value}){
  return (height / (15 * 2) * value);
}


double widthPx({width,value}){
  return (width / (15 * 2) * value);
}


class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value, mediaQueryHeight) {
    // 720 is medium screen height
    return (value / 720) * mediaQueryHeight;
  }
}