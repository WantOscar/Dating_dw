import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';

class IconHeader extends StatelessWidget implements PreferredSizeWidget {
  const IconHeader(
      {super.key, required this.text, this.actions, this.backAction});
  final void Function()? backAction;
  final double _headerHeight = 65;
  final String text;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(icon: IconShape.iconClose, onPressed: backAction),
      ),
      title: Text(
        text,
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ThemeColor.fontColor),
      ),
      centerTitle: true,
      elevation: 0,
      actions: actions,
      toolbarHeight: _headerHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_headerHeight);
}
