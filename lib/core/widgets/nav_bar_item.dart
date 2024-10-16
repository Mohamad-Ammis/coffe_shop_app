import 'package:coffe_shop/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarItem extends StatefulWidget {
  const NavBarItem({
    super.key,
    required this.image,
    required this.isActive,
  });

  final String image;
  final bool isActive;

  @override
  NavBarItemState createState() => NavBarItemState();
}

class NavBarItemState extends State<NavBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _colorAnimation = ColorTween(
      begin: Colors.black,
      end: kPrimaryColor,
    ).animate(_controller);

    if (widget.isActive) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant NavBarItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isActive) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              return SvgPicture.asset(
                widget.image,
                // ignore: deprecated_member_use
                color: _colorAnimation.value,
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedContainer(
            decoration: BoxDecoration(
              color: widget.isActive ? kPrimaryColor : Colors.black,
              borderRadius: BorderRadius.circular(999),
            ),
            clipBehavior: Clip.hardEdge,
            width: widget.isActive ? 20 : 0,
            height: 5,
            duration: const Duration(milliseconds: 500),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
