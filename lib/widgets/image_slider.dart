import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mart/constants.dart';
import 'package:mart/extensions.dart';

import '../responsive.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

final sliderImages = Constants.sliderImages ;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
            height:(Responsive.isMobile(context)) ?screenSize.height*0.3:screenSize.height*0.5,
            autoPlay: true,
            viewportFraction: (Responsive.isMobile(context))?0.9:0.6
        ),
        items: [1,2,3,4,5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,

                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(
                      color: Colors.grey
                  ),
                  child: Image.asset(sliderImages[i-1],fit: BoxFit.fill,)
              );
            },
          );
        }).toList(),
      ),
    ).addNeumorphism(
      offset: Offset(10, 10),
      borderRadius: 20,
      blurRadius: 10,
      topShadowColor: Colors.white,
      bottomShadowColor: Color(0xFF30384D).withOpacity(0.3),
    );
  }
}
