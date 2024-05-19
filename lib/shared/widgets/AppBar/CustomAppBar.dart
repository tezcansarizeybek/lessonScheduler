// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/index.dart';
import '../../enums/images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.suffix, this.title});

  final Widget? suffix;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ??
          SizedBox(
            width: 30.spMin,
            child: Images.logo_web.getImageNetwork,
          ),
      backgroundColor: AppColors.ULTRA_VIOLET,
      actions: [suffix ?? Container()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
