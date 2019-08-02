import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySwiper extends StatelessWidget {
  final List swiperList;
  MySwiper(this.swiperList) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(750),
      height: ScreenUtil.getInstance().setHeight(333),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            "${swiperList[index]}",
            fit: BoxFit.fill,
          );
        },
        itemCount: swiperList.length,
        pagination: SwiperPagination(),
        autoplay: true,
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}
