import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trampoapp/values/colors.dart';

import '../../models/activity_model.dart';
import '../../models/event_model.dart';
import '../../widgets/activity_card.dart';
import '../../widgets/event_card.dart';
import '../../widgets/promo_card.dart';

class PricingScreen extends StatelessWidget {
  final List<EventModel> featuredEvents = [
    EventModel(
      id: 1,
      title: "JUMP JUNIOR",
      location: "New York, USA",
      dateTime: "May 29, 10:00 AM",
      imagePath: "assets/images/ic_jump.png",
    ),
    EventModel(
      id: 1,
      title: "JUMP JUNIOR",
      location: "New York, USA",
      dateTime: "May 29, 10:00 AM",
      imagePath: "assets/images/ic_jump.png",
    ),
  ];
  final List<ActivityModel> activityList = [
    ActivityModel(
      title: 'JUMP ADULTS',
      time: 'Saturday: 9AM — 10PM',
      imagePath: 'assets/images/ic_jump.png',
    ),
    ActivityModel(
      title: 'KIDS JUMP',
      time: 'Sunday: 11AM — 8PM',
      imagePath: 'assets/images/ic_jump.png',
    ),
    ActivityModel(
      title: 'FAMILY NIGHT',
      time: 'Friday: 6PM — 10PM',
      imagePath: 'assets/images/ic_jump.png',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF4E3),
      appBar: AppBar(
        backgroundColor: Color(0xFFFDF4E3),
        leading: Container(
        /*  width: 25,
          height: 25,*/
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/images/ic_menu.svg',
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          'HOME',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        actions: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/ic_notification.svg',
                    fit: BoxFit.contain,
                  ),
                  onPressed: () {
                    // Your action
                  },
                ),
              ),

              // When use the IconButton for images display
              /* IconButton(
                icon: Image.asset('assets/images/ic_notification.png'),
                onPressed: () {},
              ),*/

              // for show 1 , 2 notification at the top
             /* Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.red,
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),*/
            ],
          ),
          /*CircleAvatar(
            backgroundImage: AssetImage('assets/images/ic_profile.png'),
            *//*
            radius: 16,
*//*
          ),*/
          Image.asset(
            'assets/images/ic_profile.png',
            width: 32,  // or any desired size
            height: 32,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45, // Set your desired height here
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: TextStyle(
                          color: AppColors.lightText, // Set your desired hint color
                          fontSize: 16,       // Optional: font size or other styles
                        ),
                        prefixIcon: Icon(Icons.search,  color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.zero, // Ensure padding doesn't break the height
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),

                SvgPicture.asset('assets/images/ic_filter.svg'),
              ],
            ),
            SizedBox(height: 20),
            // Promo cards
            SizedBox(
              height: 235,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PromoCard(
                    title: "BIRTHDAY PARTY",
                    subtitle: "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet",
                    imagePath: "assets/images/ic_birthday.png",
                    onTap: () {},
                  ),
                  PromoCard(
                    title: "EXTREME CAMPS",
                    subtitle: "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet",
                    imagePath: "assets/images/ic_extreme.png",
                    onTap: () {},
                  ),
                  PromoCard(
                    title: "POOL CAMPS",
                    subtitle: "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet",
                    imagePath: "assets/images/ic_extreme.png",
                    onTap: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Text(
              "FEATURED EVENTS",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: featuredEvents
                  .map((e) => Expanded(child: EventCard(event: e)))
                  .toList(),
            ),

            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "OUR ACTIVITIES",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        color: AppColors.orangeThemeColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  itemCount: activityList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final activity = activityList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: ActivityCard(
                        title: activity.title,
                        time: activity.time,
                        imagePath: activity.imagePath,
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
