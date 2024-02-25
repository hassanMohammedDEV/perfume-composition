import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfume_composition/controller/composition_controller.dart';
import 'package:perfume_composition/model/app_colors.dart';
import 'package:perfume_composition/ui/shared/custom_widgets/custom_elevated_button.dart';
import 'package:perfume_composition/ui/shared/custom_widgets/custom_text_field_with_out_header.dart';
import 'package:perfume_composition/ui/shared/custom_widgets/custom_text_label.dart';

class CompositionScreen extends StatelessWidget {
  const CompositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompositionController>(
        init: CompositionController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'الكمية المطلوبة',
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: CustomTextFieldWithOutHeader(
                                        hintText: 'أدخل مقدار الكمية',
                                        validator: quantityValidator,
                                        keyboardType: TextInputType.number,
                                        controller: controller.composition),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 7,
                                        offset: const Offset(0, 2), // changes position of shadow
                                      ),
                                    ],
                                    color: AppColors.mainCardBackground,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('المرحلة الأولى',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        controller.oilAmount != null
                                            ? CustomTextLabel(
                                                text: controller.oilAmount
                                                        ?.toString() ??
                                                    '')
                                            : const SizedBox(),
                                        buildTitle('مقدار الزيت')
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        controller.alcoholAmountForFirstStep !=
                                                null
                                            ? CustomTextLabel(
                                                text: controller
                                                        .alcoholAmountForFirstStep
                                                        ?.toString() ??
                                                    '')
                                            : const SizedBox(),
                                        buildTitle('مقدار الكحول')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 7,
                                        offset: const Offset(0, 2), // changes position of shadow
                                      ),
                                    ],
                                    color: AppColors.mainCardBackground,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('المرحلة الثانية',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        controller.alcoholAmountForSecondStep !=
                                                null
                                            ? CustomTextLabel(
                                                text: controller
                                                        .alcoholAmountForSecondStep
                                                        ?.toString() ??
                                                    '')
                                            : const SizedBox(),
                                        buildTitle('مقدار الكحول')
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        controller.waterAmount != null
                                            ? CustomTextLabel(
                                                text: controller.waterAmount
                                                        ?.toString() ??
                                                    '')
                                            : const SizedBox(),
                                        buildTitle('مقدار الماء')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomElevatedButton(
                          text: 'إحتساب', onTap: () => controller.onCalculate())
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: AppColors.black, fontSize: 17, fontWeight: FontWeight.bold),
    );
  }

  static String? quantityValidator(String? val) {
    String value = val?.trim() ?? '';
    if (value.isEmpty) {
      return 'حقل مطلوب';
    }
    return null;
  }
}
