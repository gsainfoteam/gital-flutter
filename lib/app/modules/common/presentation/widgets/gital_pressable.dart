import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GitalPressable extends StatefulWidget {
  const GitalPressable({
    super.key,
    this.onTap,
    required this.child,
    this.opacity = 0.5,
    this.hitTestBehavior = HitTestBehavior.opaque,
  });

  final VoidCallback? onTap;
  final Widget child;
  final double opacity;
  final HitTestBehavior hitTestBehavior;

  @override
  State<GitalPressable> createState() => _GitalPressableState();
}

class _GitalPressableState extends State<GitalPressable> {
  bool _pressed = false;
  bool _active = false;
  bool get pressed => _pressed || _active;

  static const _minPressedDuration = Duration(milliseconds: 80);
  static const _animationDuration = Duration(milliseconds: 50);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: widget.hitTestBehavior,
      onTap: widget.onTap,
      onTapDown: (_) {
        if (widget.onTap == null) return;
        HapticFeedback.lightImpact();
        setState(() {
          _pressed = true;
          _active = true;
        });
        Future.delayed(_minPressedDuration, () {
          if (!mounted) return;
          setState(() => _active = false);
        });
      },
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedOpacity(
        opacity: pressed ? widget.opacity : 1.0,
        duration: _animationDuration,
        child: widget.child,
      ),
    );
  }
}
