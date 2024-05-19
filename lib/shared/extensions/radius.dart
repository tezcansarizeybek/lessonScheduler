import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppBorderRadiusExtension on num {
  BorderRadius get radiusVertical => BorderRadius.vertical(
        top: Radius.circular(toDouble().h),
        bottom: Radius.circular(toDouble().h),
      );
  BorderRadius get radiusHorizontal => BorderRadius.horizontal(
        left: Radius.circular(toDouble().w),
        right: Radius.circular(toDouble().w),
      );
  BorderRadius get radiusAll => BorderRadius.circular(toDouble().r);
  BorderRadius get radiusTop => BorderRadius.only(
        topLeft: Radius.circular(toDouble().h),
        topRight: Radius.circular(toDouble().h),
      );
  BorderRadius get radiusTopLeft => BorderRadius.only(
        topLeft: Radius.circular(toDouble().h),
      );
  BorderRadius get radiusTopRight => BorderRadius.only(
        topRight: Radius.circular(toDouble().h),
      );
  BorderRadius get radiusBottom => BorderRadius.only(
        bottomLeft: Radius.circular(toDouble().h),
        bottomRight: Radius.circular(toDouble().h),
      );
  BorderRadius get radiusBottomLeft =>
      BorderRadius.only(bottomLeft: Radius.circular(toDouble().h));
  BorderRadius get radiusBottomRight =>
      BorderRadius.only(bottomRight: Radius.circular(toDouble().h));
  BorderRadius get radiusCircular => BorderRadius.circular(toDouble().h);
}
