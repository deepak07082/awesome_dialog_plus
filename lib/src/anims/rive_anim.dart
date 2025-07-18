import 'package:flutter/material.dart';

///RiveRuntimeRender
class RiveAssetAnimation extends StatefulWidget {
  ///Constructor
  const RiveAssetAnimation({
    required this.assetPath,
    required this.animName,
    super.key,
  });

  ///Path of the .riv assets file
  final String assetPath;

  ///Name od the animation to load
  final String animName;
  @override
  State<RiveAssetAnimation> createState() => _RiveAnimationState();
}

class _RiveAnimationState extends State<RiveAssetAnimation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(widget.assetPath);
  }
}
