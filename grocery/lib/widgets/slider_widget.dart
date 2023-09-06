import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/controller/slider_controller.dart';
import 'package:grocery/theme/light_theme.dart';

SliderController sliderController = Get.put(SliderController());
Widget slider() {
  List<String> sliderImages = [
    "https://media.istockphoto.com/id/1316145885/tr/fotoğraf/yemek-yemeye-hazır.jpg?s=1024x1024&w=is&k=20&c=0m_CDm9t8TVgTXIxnAZlAC1ikO8u5nowoLiV86tWvX8=",
    "https://media.istockphoto.com/id/1277767891/tr/fotoğraf/arka-plan-olarak-çeşitli-taze-olgun-kabaklar.jpg?s=1024x1024&w=is&k=20&c=kDv3nfJMbqTHcG8dzaRyyMD_1fyi65fihcdIdRUaiGA=",
    "https://media.istockphoto.com/id/1385196919/tr/fotoğraf/inflation-concept.jpg?s=1024x1024&w=is&k=20&c=PMeF685zoq-_4bixPtfPdvkjCfpS2s8eEWu8-8LqeFE=",
  ];
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: CarouselSlider(
          options: CarouselOptions(
            height: Get.height / 5,
            autoPlay: true,
            onPageChanged: (index, reason) {
              sliderController.sliderCircular.value = index;
            },
          ),
          items: sliderImages.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(i))),
                );
              },
            );
          }).toList(),
        ),
      ),
      Container(
          alignment: Alignment.center,
          width: Get.width / 4,
          height: 14,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: sliderImages.map((e) {
              return sliderCircular(sliderImages, e);
            }).toList(),
          ))
    ],
  );
}

Widget sliderCircular(sliderImages, e) {
  int circularIndex = sliderImages.indexOf(e);
  return Obx(() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
              color: sliderController.sliderCircular.value == circularIndex
                  ? lightTheme.colorScheme.primary
                  : lightTheme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(100)),
        ),
      ));
}
