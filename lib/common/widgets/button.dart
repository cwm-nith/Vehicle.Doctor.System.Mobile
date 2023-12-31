import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_doctor_mobile/common/values/colors.dart';
import 'package:vehicle_doctor_mobile/common/values/radii.dart';

///
Widget btnFlatButtonWidget({
  required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  Color bgColor = AppColors.secondaryElementText,
  String title = "button",
  Color fontColor = AppColors.primaryText,
  double fontSize = 16,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
  bool isDisable = false,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(
          fontSize: 16.sp,
        )),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.focused) &&
                !states.contains(MaterialState.pressed)) {
              return Colors.blue;
            } else if (states.contains(MaterialState.pressed)) {
              return Colors.deepPurple;
            }
            return fontColor;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (isDisable) return bgColor;
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue[200];
          }
          return bgColor.withOpacity(0.9);
        }),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: Radii.k4pxRadius,
        )),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontWeight: fontWeight,
          fontSize: fontSize.sp,
          height: 1,
        ),
      ),
    ),
  );
}

///
Widget btnFlatButtonBorderOnlyWidget({
  required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  required String iconFileName,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextButton(
      style: ButtonStyle(
        // textStyle: MaterialStateProperty.all(TextStyle(
        //   fontSize: 16.sp,
        // )),
        // foregroundColor: MaterialStateProperty.resolveWith(
        //   (states) {
        //     if (states.contains(MaterialState.focused) &&
        //         !states.contains(MaterialState.pressed)) {
        //       return Colors.blue;
        //     } else if (states.contains(MaterialState.pressed)) {
        //       return Colors.deepPurple;
        //     }
        //     return AppColors.primaryElementText;
        //   },
        // ),
        // backgroundColor: MaterialStateProperty.resolveWith((states) {
        //   if (states.contains(MaterialState.pressed)) {
        //     return Colors.blue[200];
        //   }
        //   return AppColors.primaryElement;
        // }),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: Radii.k6pxRadius,
        )),
      ),
      onPressed: onPressed,
      child: Image.asset(
        "assets/images/icons-$iconFileName.png",
      ),
    ),
  );
}
