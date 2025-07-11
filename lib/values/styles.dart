import 'package:flutter/material.dart';
import 'package:trampoapp/values/colors.dart';
// Define styles here
const TextStyle textDescriptionW40014 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: AppColors.description,
  fontFamily: 'Poppins',
);
const TextStyle textDescriptionW50016 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: AppColors.description,
  fontFamily: 'Poppins',
);
const TextStyle textDarkW50016 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: AppColors.darkText,
  fontFamily: 'Poppins',
);

const TextStyle textLightW40016 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: AppColors.lightText,
  fontFamily: 'Poppins',
);

const TextStyle textOrangeW50016 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: AppColors.orangeThemeColor,
  fontFamily: 'Poppins',
);

const TextStyle textWhiteW50016 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: AppColors.white,
  fontFamily: 'Poppins',
);


Container horizontalLineDivider = Container(
  width: double.infinity,
  height: 1.0,
  color: const Color(0xFFCDCBCB),
  margin: const EdgeInsets.only(top: 10.0), // equivalent to _10sdp
);

Container verticalLineDivider = Container(
  width: 1.0,
  height: double.infinity,
  color: Color(0xFF8D8D8D),
);

const TextStyle buttonTextStyle = TextStyle(
  color: Color(0xFF0C0C0C), // btn_text_color equivalent
  letterSpacing: 0.01,
  fontSize: 12.0,
  fontFamily: 'Poppins',
);

final InputDecoration outlinedTextInputDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black, width: 1.0),
    borderRadius: BorderRadius.circular(15.0), // Adjust corner radius as needed
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black, width: 1.0),
    borderRadius: BorderRadius.circular(15.0),
  ),
  hintText: 'Your hint here', // Add hint text if needed
);
const TextStyle errorTextStyle = TextStyle(
  fontSize: 11.0,
  color: Color(0xFFB00020), // equivalent to red_50
);
