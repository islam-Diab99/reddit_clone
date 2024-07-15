import 'package:flutter/material.dart';

enum TransitionDirection { up, down }

class AnimatedIconWidget extends StatefulWidget {
  final Icon defaultIcon;
  final Icon onTransitionIcon;
  final TransitionDirection transitionDirection;
  final VoidCallback onPressed;
  final bool isActive;
  const AnimatedIconWidget({
    super.key,
    required this.defaultIcon,
    required this.onTransitionIcon,
    required this.transitionDirection,
    required this.onPressed,
    required this.isActive,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedIconWidgetState createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool isIconPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(
        0.0,
        widget.transitionDirection == TransitionDirection.up ? -0.5 : 0.5,
      ),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateIcon() {
    widget.onPressed();
    _controller.forward().then((_) {
      _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: GestureDetector(
        onTap: _animateIcon,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: widget.isActive ? widget.onTransitionIcon : widget.defaultIcon,
        ),
      ),
    );
  }
}
