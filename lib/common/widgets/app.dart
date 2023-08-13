import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_doctor_mobile/common/values/colors.dart';

///  AppBar
AppBar transparentAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    flexibleSpace: Container(
      decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     Color.fromARGB(255, 176, 106, 231),
          //     Color.fromARGB(255, 166, 112, 232),
          //     Color.fromARGB(255, 131, 123, 232),
          //     Color.fromARGB(255, 104, 132, 231),
          //   ],
          //   transform: GradientRotation(90),
          // ),
          color: AppColors.secondaryElementText.withOpacity(0.9)),
    ),
    title: title != null ? Center(child: title) : null,
    leading: leading,
    actions: actions,
  );
}

AppBar appBarWithBack(BuildContext context, title) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 24.sp,
      ),
    ),
    leading: IconButton(
      icon: Icon(
        Icons.chevron_left,
        color: Colors.black,
        size: 38.w,
      ),
      onPressed: () => Navigator.of(context).pop(),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

Widget divider10Px({Color bgColor = AppColors.secondaryElement}) {
  return Container(
    height: 10.w,
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}
