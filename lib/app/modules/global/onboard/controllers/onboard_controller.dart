import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  //TODO: Implement OnboardController

  final count = 0.obs;
  final PageController pageController = PageController();
  RxDouble linearProgressValue = 0.333.obs;
  final RxInt currentPage = 0.obs;
  final List headTexts = [
    'Order whatever you want to eat ',
    'Choose a better delivery location',
    'Get your order as fast as you think',
    'Let’s Order your favourite food'
  ];
  final List bodyTexts = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum a elementum sit eu quam ',
    'Lorem ipsum dolor sit amet, consectetur adipis a elementum sit eu quam vulputate ultricies a.',
    'Lorem ipsum dolor sit amet, consectetur adipis a elementum sit eu quam vulputate ultricies a.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sed mi velit semper tortor orci. Quam.'
  ];
  final List imagePath = [
    'assets/images/onboard/onboard_one.png',
    'assets/images/onboard/onboard_two.png',
    'assets/images/onboard/onboard_three.png',
    'assets/images/onboard/final_onboard.png',
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
