import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationListTile extends StatelessWidget {
  const LocationListTile({
    Key? key,
    required this.location,
    required this.press,
    required this.textStyle,
    required this.leading,
  }) : super(key: key);

  final String location;
  final VoidCallback press;
  final TextStyle textStyle;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: InkWell(
        onTap: press,
        child: Column(
          children: [
            Row(
              children: [
                leading,
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  location,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle,
                ),
              ],
            ),
            SizedBox(
              height: 16.w,
            ),
          ],
        ),
      ),
    );
  }
}
