import 'package:awesome_dialog_plus/awesome_dialog_plus.dart'
    show AwesomeDialog, DialogType;
import 'package:awesome_dialog_plus/src/anims/rive_anim.dart';
import 'package:flutter/material.dart';

///Header of the [AwesomeDialog]
class AwesomeDialogHeader extends StatelessWidget {
  ///Constructor of the [AwesomeDialogHeader]
  const AwesomeDialogHeader({
    required this.dialogType,
    required this.loop,
    super.key,
  });

  ///Defines the type of [AwesomeDialogHeader]
  final DialogType dialogType;

  ///Defines if the animation loops or not
  final bool loop;

  @override
  Widget build(BuildContext context) {
    switch (dialogType) {
      case DialogType.info:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog_plus/assets/info.gif',
          animName: loop ? 'appear_loop' : 'appear',
        );
      case DialogType.question:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog_plus/assets/question.gif',
          animName: loop ? 'appear_loop' : 'appear',
        );
      case DialogType.warning:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog_plus/assets/warning.gif',
          animName: loop ? 'appear_loop' : 'appear',
        );
      case DialogType.error:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog_plus/assets/error.gif',
          animName: loop ? 'appear_loop' : 'appear',
        );
      case DialogType.success:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog_plus/assets/success.gif',
          animName: loop ? 'appear_loop' : 'appear',
        );
      case DialogType.noHeader:
        return const SizedBox.shrink();
    }
  }
}
