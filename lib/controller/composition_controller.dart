import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompositionController extends GetxController {
  late TextEditingController composition;
     double? oilAmount,
      alcoholAmountForFirstStep,
      alcoholAmountForSecondStep,
      waterAmount;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
  }

  init(){
    composition = TextEditingController();
  }

  double getPercent(double percent) {
    return (percent / 100) * double.parse(composition.text.trim());
  }

  onCalculate() {
    if(formKey.currentState!.validate()){
      oilAmount = getPercent(5);
      alcoholAmountForFirstStep = getPercent(15);
      alcoholAmountForSecondStep = getPercent(40);
      waterAmount = getPercent(40);
      update();
    }
  }

}
