// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

///Main widget to render dialog UI
class VerticalStackDialog extends StatelessWidget {
  const VerticalStackDialog({
    required this.header,
    required this.padding,
    required this.onClose,
    super.key,
    this.title,
    this.titleStyle,
    this.desc,
    this.descStyle,
    this.descAlign,
    this.btnOk,
    this.btnCancel,
    this.body,
    this.alignment,
    this.isDense = true,
    this.keyboardAware = true,
    this.width,
    this.showCloseIcon,
    this.closeIcon,
    this.dialogBackgroundColor,
    this.borderSide,
    this.borderRadius,
    this.bodyHeaderDistance = 15.0,
    this.reverseBtnOrder = false,
  });
  final String? title;
  final TextStyle? titleStyle;
  final String? desc;
  final TextStyle? descStyle;
  final TextAlign? descAlign;
  final Widget? btnOk;
  final Widget? btnCancel;
  final Widget? header;
  final Widget? body;
  final bool isDense;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry padding;
  final bool keyboardAware;
  final double? width;
  final bool? showCloseIcon;
  final void Function() onClose;
  final Widget? closeIcon;
  final Color? dialogBackgroundColor;
  final BorderSide? borderSide;
  final BorderRadiusGeometry? borderRadius;
  final double bodyHeaderDistance;
  final bool reverseBtnOrder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);
    return Container(
      alignment: alignment,
      padding: EdgeInsets.only(
        bottom: keyboardAware ? mediaQueryData.viewInsets.bottom : 0,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: width ?? mediaQueryData.size.width,
            padding: isDense
                ? const EdgeInsets.only(
                    top: 65,
                    left: 15,
                    right: 15,
                    bottom: 10,
                  )
                : const EdgeInsets.only(
                    top: 65,
                    left: 40,
                    right: 40,
                    bottom: 10,
                  ),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius:
                    borderRadius ?? const BorderRadius.all(Radius.circular(10)),
                side: borderSide ?? BorderSide.none,
              ),
              elevation: 0.5,
              color: dialogBackgroundColor ?? theme.cardColor,
              child: Padding(
                padding: padding,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: header != null ? 50.0 : bodyHeaderDistance,
                      ),
                      body ??
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              if (title != null) ..._titleBody(title!, theme),
                              if (desc != null)
                                Flexible(
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Text(
                                      desc!,
                                      textAlign: descAlign ?? TextAlign.center,
                                      style: descStyle,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                      if (desc != null) const SizedBox(height: 16),
                      if (btnOk != null || btnCancel != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              if (reverseBtnOrder) ...[
                                if (btnOk != null) Expanded(child: btnOk!),
                                if (btnCancel != null && btnOk != null)
                                  const SizedBox(width: 10),
                                if (btnCancel != null)
                                  Expanded(child: btnCancel ?? Container()),
                              ] else ...[
                                if (btnCancel != null)
                                  Expanded(child: btnCancel ?? Container()),
                                if (btnCancel != null && btnOk != null)
                                  const SizedBox(width: 10),
                                if (btnOk != null) Expanded(child: btnOk!),
                              ],
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (header != null)
            SizedBox(
              width: width ?? mediaQueryData.size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    shape: CircleBorder(side: borderSide ?? BorderSide.none),
                    child: CircleAvatar(
                      backgroundColor: dialogBackgroundColor ?? theme.cardColor,
                      radius: 55,
                      child: header,
                    ),
                  ),
                ],
              ),
            ),
          if (showCloseIcon!)
            Positioned(
              right: 50,
              top: 75,
              child: GestureDetector(
                onTap: onClose.call,
                child: closeIcon ?? const Icon(Icons.close),
              ),
            ),
        ],
      ),
    );
  }

  /// The default widget for the Title of dialog
  List<Widget> _titleBody(String title, ThemeData theme) => <Widget>[
    Text(
      title,
      textAlign: TextAlign.center,
      style: titleStyle ?? theme.textTheme.titleLarge,
    ),
    const SizedBox(height: 10),
  ];
}
