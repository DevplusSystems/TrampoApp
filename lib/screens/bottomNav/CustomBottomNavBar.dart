import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../values/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const CustomBottomNavBar({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem(icon: 'assets/images/ic_homee.svg', label: "Home"),
      _NavItem(icon: 'assets/images/ic_venue.svg', label: "Venues"),
      _NavItem(icon: 'assets/images/ic_chatbot.svg', label: "Chatbot"),
      _NavItem(icon: 'assets/images/ic_events.svg', label: "Events"),
      _NavItem(icon: 'assets/images/ic_pricing.svg', label: "Pricing"),
    ];

    return SizedBox(
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Clipped path with dip
          Positioned.fill(
            child: ClipPath(
              clipper: CurvedNavClipper(
                selectedIndex: currentIndex,
                itemCount: items.length,
              ),
              child: Container(
                color: Colors.white, // or use withOpacity if needed
              ),
            ),
          ),

          // Orange dot indicator
          Positioned(
            top: -8,
            left: _calculateDotX(context, currentIndex, items.length),
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: AppColors.orangeThemeColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),

          // Nav items
          Positioned.fill(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(items.length, (index) {
                final selected = index == currentIndex;
                final color = selected
                    ? AppColors.orangeThemeColor.withOpacity(0.6)
                    : AppColors.orangeThemeColor;

                return Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => onTap?.call(index),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            items[index].icon,
                            height: 20,
                            color: color,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            items[index].label,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  double _calculateDotX(BuildContext context, int index, int itemCount) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / itemCount;
    return index * itemWidth + itemWidth / 2 - 8;
  }
}

class CurvedNavClipper extends CustomClipper<Path> {
  final int selectedIndex;
  final int itemCount;

  CurvedNavClipper({
    required this.selectedIndex,
    required this.itemCount,
  });

  @override
  Path getClip(Size size) {
    final double itemWidth = size.width / itemCount;
    final double centerX = itemWidth * selectedIndex + itemWidth / 2;
    final double curveRadius = 32;
    final double dipDepth = 17;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(centerX - curveRadius, 0)
      ..cubicTo(
        centerX - curveRadius / 2, 0,
        centerX - curveRadius / 2, dipDepth,
        centerX, dipDepth,
      )
      ..cubicTo(
        centerX + curveRadius / 2, dipDepth,
        centerX + curveRadius / 2, 0,
        centerX + curveRadius, 0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class _NavItem {
  final String icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}




/*import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const CustomBottomNavBar({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem(icon: 'assets/images/ic_homee.svg', label: "Home"),
      _NavItem(icon: 'assets/images/ic_venue.svg', label: "Venues"),
      _NavItem(icon: 'assets/images/ic_chatbot.svg', label: "Chatbot"),
      _NavItem(icon: 'assets/images/ic_events.svg', label: "Events"),
      _NavItem(icon: 'assets/images/ic_pricing.svg', label: "Pricing"),
    ];

    return Stack(
      children: [
        // The curved background with notch
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
            size: const Size(double.infinity, 80),
            painter: BottomNavPainter(currentIndex, items.length, AppColors.orangeThemeColor.withOpacity(0.6)),
          ),
        ),
        // Foreground icons and labels
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length, (index) {
                final selected = index == currentIndex;
                final Color selectedColor = AppColors.orangeThemeColor.withOpacity(0.6);
                final Color unselectedColor = AppColors.orangeThemeColor;

                return GestureDetector(
                  onTap: () => onTap?.call(index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (selected)
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(bottom: 4),
                          decoration: BoxDecoration(
                            color: selectedColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              items[index].icon,
                              height: 24,
                              width: 24,
                              color: Colors.white,
                            ),
                          ),
                        )
                      else
                        SvgPicture.asset(
                          items[index].icon,
                          height: 24,
                          width: 24,
                          color: unselectedColor,
                        ),
                      const SizedBox(height: 4),
                      Text(
                        items[index].label,
                        style: textDescriptionW40014.copyWith(
                          color: selected ? selectedColor : unselectedColor,
                          fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class BottomNavPainter extends CustomPainter {
  final int selectedIndex;
  final int itemCount;
  final Color color;

  BottomNavPainter(this.selectedIndex, this.itemCount, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    final notchPaint = Paint()..color = color;

    final path = Path();
    final width = size.width;
    final height = size.height;

    // Draw full bottom nav bar
    path.moveTo(0, 0);
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);

    // Notch
    final notchRadius = 30.0;
    final spacing = width / itemCount;
    final centerX = spacing * selectedIndex + spacing / 2;

    path.moveTo(centerX - notchRadius - 10, 0);
    path.quadraticBezierTo(
      centerX, -notchRadius,
      centerX + notchRadius + 10, 0,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _NavItem {
  final String icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}*/




/*curved background orange dot not center and notch*/
/*
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const CustomBottomNavBar({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem(icon: 'assets/images/ic_homee.svg', label: "Home"),
      _NavItem(icon: 'assets/images/ic_venue.svg', label: "Venues"),
      _NavItem(icon: 'assets/images/ic_chatbot.svg', label: "Chatbot"),
      _NavItem(icon: 'assets/images/ic_events.svg', label: "Events"),
      _NavItem(icon: 'assets/images/ic_pricing.svg', label: "Pricing"),
    ];

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Curved background
        CustomPaint(
          painter: CurvedNavPainter(
            selectedIndex: currentIndex,
            itemCount: items.length,
          ),
          child: Container(height: 70),
        ),

        // Floating circle above selected item
        Positioned.fill(
          top: -10, // reduced offset
          child: Align(
            alignment: Alignment(
              _calculateAlignX(currentIndex, items.length),
              -1.2, // better vertical centering
            ),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: AppColors.orangeThemeColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),

        // Navigation items
        SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final selected = index == currentIndex;
              final color = selected
                  ? AppColors.orangeThemeColor.withOpacity(0.6)
                  : AppColors.orangeThemeColor;

              return GestureDetector(
                onTap: () => onTap?.call(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10), // spacing for floating dot
                    SvgPicture.asset(
                      items[index].icon,
                      height: 24,
                      color: color,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      items[index].label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight:
                        selected ? FontWeight.w600 : FontWeight.w400,
                        color: color,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  /// Calculate alignment X from -1 (left) to 1 (right)
  double _calculateAlignX(int index, int total) {
    final step = 2 / (total - 1);
    return -1 + (index * step);
  }
}

class CurvedNavPainter extends CustomPainter {
  final int selectedIndex;
  final int itemCount;

  CurvedNavPainter({
    required this.selectedIndex,
    required this.itemCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    final double notchRadius = 16; // slightly reduced for smaller circle
    final double centerX = (size.width / itemCount) * selectedIndex +
        (size.width / itemCount) / 2;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(centerX - notchRadius - 10, 0)
      ..quadraticBezierTo(
        centerX - notchRadius,
        0,
        centerX - notchRadius + 5,
        10,
      )
      ..arcToPoint(
        Offset(centerX + notchRadius - 5, 10),
        radius: const Radius.circular(10),
        clockwise: false,
      )
      ..quadraticBezierTo(
        centerX + notchRadius,
        0,
        centerX + notchRadius + 10,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawShadow(path, Colors.black26, 4, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _NavItem {
  final String icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}
*/

