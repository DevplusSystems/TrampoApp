import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trampoapp/values/colors.dart';
import '../models/event_model.dart';
import '../values/styles.dart';

class EventCard extends StatelessWidget {
  final EventModel event;

  const EventCard({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: AppColors.blueThemeColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(8), // ⬅️ Padding added here
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    event.imagePath,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_location.svg',
                        ),
                        SizedBox(width: 4),
                        Text(
                          event.location,
                            style: textDescriptionW40014.copyWith(color: Colors.white)
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_date_time.svg',
                        ),
                        SizedBox(width: 4),
                        Text(
                          event.dateTime,
                            style: textDescriptionW40014.copyWith(color: Colors.white)
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 🔽 Bottom-right positioned icon
          Positioned(
            bottom: 8,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/ic_learn_more.svg',
            ),
          ),
        ],
      ),
    );
  }
}
