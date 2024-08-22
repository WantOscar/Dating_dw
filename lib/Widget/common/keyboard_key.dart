import 'package:flutter/material.dart';

class KeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;
  const KeyboardKey(
      {super.key, required this.label, this.value, required this.onTap});

  @override
  State<KeyboardKey> createState() => _KeyboardKeyState();
}

class _KeyboardKeyState extends State<KeyboardKey> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => widget.onTap(widget.value),
        borderRadius: BorderRadius.circular(12.0),
        child: AspectRatio(
          aspectRatio: 2,
          child: Container(
            alignment: Alignment.center,
            child: (widget.label is String)
                ? Text(
                    widget.label,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  )
                : widget.label,
          ),
        ));
  }
}
