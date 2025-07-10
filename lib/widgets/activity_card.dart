import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../values/colors.dart';
import '../values/styles.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final String time;
  final String imagePath;

  const ActivityCard({
    required this.title,
    required this.time,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.blueThemeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 55,
              height: 55,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Ensures it wraps content
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4), // optional spacing between title and time
                Text(
                  time,
                  style: textDescriptionW40014.copyWith(color: Colors.white)
                ),
              ],
            ),
          ),

          /* SvgPicture.asset(
            'assets/images/ic_right_arrow.svg',
     *//*       width: 16,
            height: 16,*//*
          ),*/
          Container(
            padding: EdgeInsets.only(right: 8), // same result
            child: SvgPicture.asset(
              'assets/images/ic_right_arrow.svg',
            ),
          ),
        ],
      ),
    );
  }
}

/*
Icon(Icons.arrow_forward, color: Colors.white),
*/




