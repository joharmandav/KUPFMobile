import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf/app_utility/app_color.dart';
import 'package:kupf/app_utility/app_text_theme.dart';
import 'package:kupf/app_utility/common_function.dart';
import 'package:kupf/app_utility/image_string.dart';
import 'package:kupf/widgets/curve_box_decoration.dart';
import 'package:kupf/widgets/k_text.dart';

import '../../../../languages/language_constants.dart';
import '../../../../widgets/custom_card.dart';
import '../../../../widgets/loading.dart';
import '../../../controller/main/general_controller.dart';
import '../../../controller/services/service_setup_controller.dart';
import '../../../models/service_setup_model.dart';


class ServiceBody extends StatelessWidget {
  const ServiceBody({super.key});

  void detailPage() {
    Get.to(() => const _DetailScreen());
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceSetupController());
    return Obx(() {
      if (controller.serviceSetUPList.isEmpty && controller.isLoading) {
        return const LoadingWidget();
      } else if (controller.serviceSetUPList.isEmpty && !controller.isLoading) {
        return const Center(child: Text("No Service Found"));
      }
      return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.serviceSetUPList.length,
        itemBuilder: (context, index) {
          ServiceSetupModel serviceSetupModel = controller.serviceSetUPList[index];
          return Column(
            children: [
              GestureDetector(
                onTap: detailPage,
                child: CustomCard(
                  height: 96,
                  width: double.infinity,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Container(
                          color: mainColor.value.withOpacity(0.5),
                          width: 80,
                          child: const Image(image: ImageString.hajjLoan),
                        ),
                      ),
                      const SizedBox(width: 24.0),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: KText(Get.find<GeneralController>().isArabic() ? serviceSetupModel.serviceName2.split(" - ").first : serviceSetupModel.serviceName1.split(" - ").first,
                                        style: AppTextTheme.bodyText1Black.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  ),
                                  KText("ID: ${serviceSetupModel.serviceID}",
                                      style: AppTextTheme.bodyText1Black),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(serviceSetupModel.entryDate ?? "24 Dec 21"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppUtility.heightBox,
              AppUtility.heightBox,
            ],
          );
        },
      );
    });
    // return Column(
    //   children: [
    //     Expanded(
    //       child: ListView(
    //         children: [
    //           ExpansionTile(
    //             //initiallyExpanded: _isOpen[0],
    //             //key: UniqueKey(),
    //             title: KText(
    //               '${AppString.serviceProcured}: ',
    //               style: AppTextTheme.bodyText1Primary
    //                   .copyWith(fontWeight: FontWeight.bold),
    //             ),
    //             subtitle: KText(AppString.hajjLoan,
    //                 style: AppTextTheme.bodyText1Black),
    //             onExpansionChanged: (value) {
    //               _toggle = value;
    //               _toggletwo = false;
    //               setState(() {});
    //             },
    //             childrenPadding: const EdgeInsets.symmetric(horizontal: 14.0),
    //             children: [
    //               Container(
    //                 padding: const EdgeInsets.symmetric(horizontal: 2),
    //                 decoration: BoxDecoration(
    //                   color: AppColor.primary.withOpacity(0.05),
    //                 ),
    //                 child: Row(children: [
    //                   Expanded(
    //                       child: KText('Finishing Date',
    //                           style: AppTextTheme.bodyText1Primary
    //                               .copyWith(fontWeight: FontWeight.bold))),
    //                   Expanded(child: KText('01-March-2023')),
    //                 ]),
    //               ),
    //               AppUtility.heightBox,
    //               Container(
    //                 padding: const EdgeInsets.symmetric(horizontal: 2),
    //                 decoration: BoxDecoration(
    //                   color: AppColor.primary.withOpacity(0.05),
    //                 ),
    //                 child: Row(children: [
    //                   Expanded(
    //                       child: KText('Pending Amount',
    //                           style: AppTextTheme.bodyText1Primary
    //                               .copyWith(fontWeight: FontWeight.bold))),
    //                   Expanded(child: KText('1100.86')),
    //                 ]),
    //               ),
    //               AppUtility.heightBox,
    //             ],
    //           ),
    //           ExpansionTile(
    //             childrenPadding: const EdgeInsets.symmetric(horizontal: 14.0),
    //             onExpansionChanged: (value) {
    //               _toggle = false;
    //               _toggletwo = value;
    //               setState(() {});
    //             },
    //             title: KText(
    //               '${AppString.serviceProcured}: ',
    //               style: AppTextTheme.bodyText1Primary
    //                   .copyWith(fontWeight: FontWeight.bold),
    //             ),
    //             subtitle: KText(AppString.socialFinanceLoanInternet,
    //                 style: AppTextTheme.bodyText1Black),
    //             children: [
    //               Container(
    //                 padding: const EdgeInsets.symmetric(horizontal: 2),
    //                 decoration: BoxDecoration(
    //                   color: AppColor.primary.withOpacity(0.05),
    //                 ),
    //                 child: Row(children: [
    //                   Expanded(
    //                       child: KText('Finishing Date',
    //                           style: AppTextTheme.bodyText1Primary
    //                               .copyWith(fontWeight: FontWeight.bold))),
    //                   Expanded(child: KText('01-March-2023')),
    //                 ]),
    //               ),
    //               AppUtility.heightBox,
    //               Container(
    //                 padding: const EdgeInsets.symmetric(horizontal: 2),
    //                 decoration: BoxDecoration(
    //                   color: AppColor.primary.withOpacity(0.05),
    //                 ),
    //                 child: Row(children: [
    //                   Expanded(
    //                       child: KText('Pending Amount',
    //                           style: AppTextTheme.bodyText1Primary
    //                               .copyWith(fontWeight: FontWeight.bold))),
    //                   Expanded(child: KText('1100.86')),
    //                 ]),
    //               ),
    //               AppUtility.heightBox,
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //
    //     ///lower Section
    //     Expanded(
    //       flex: 2,
    //       child: DecoratedBox(
    //         decoration: BoxDecoration(color: AppColor.primary.withOpacity(0.1)),
    //         child: AnimatedSwitcher(
    //             duration: AppUtility.defaultDuration,
    //             child: _toggle || _toggletwo
    //                 ? (_toggle
    //                     ? ListView(
    //                         children: [
    //                           AppUtility.heightBox,
    //                           FakeTile(),
    //                           AppUtility.heightBox,
    //                           FakeTileTwo(),
    //                           AppUtility.heightBox,
    //                           FakeTileTwo(),
    //                           AppUtility.heightBox,
    //                         ],
    //                       )
    //                     : ListView(
    //                         key: UniqueKey(),
    //                         children: [
    //                           AppUtility.heightBox,
    //                           FakeTileThree(),
    //                           AppUtility.heightBox,
    //                         ],
    //                       ))
    //                 : SizedBox.expand()),
    //       ),
    //     ),
    //     AppUtility.heightBox,
    //     AppUtility.heightBox,
    //   ],
    // );
  }
}

class FakeTile extends StatelessWidget {
  const FakeTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(horizontal: 14.0),
      title: KText(
        '${LanguageConstants.serviceProcured.tr}: ',
        style:
            AppTextTheme.bodyText1Primary.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: KText(LanguageConstants.hajjLoan.tr,
          style: AppTextTheme.bodyText1Black),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText('${LanguageConstants.installment.tr}#',
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('01-Feb-2023')),
          ]),
        ),
        AppUtility.heightBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText(LanguageConstants.pendingAmount.tr,
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('1100.86')),
          ]),
        ),
        AppUtility.heightBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText(LanguageConstants.receivedDate.tr,
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('24-Dec-2252')),
          ]),
        ),
        AppUtility.heightBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText(LanguageConstants.receivedAmount.tr,
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('1100.86')),
          ]),
        ),
        AppUtility.heightBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText(LanguageConstants.financeReference.tr,
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('6-May-2000')),
          ]),
        ),
        AppUtility.heightBox,
      ],
    );
  }
}

class FakeTileTwo extends StatelessWidget {
  const FakeTileTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(horizontal: 14.0),
      title: KText(
        '${LanguageConstants.serviceProcured.tr}: ',
        style:
            AppTextTheme.bodyText1Primary.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: KText(LanguageConstants.hajjLoan.tr,
          style: AppTextTheme.bodyText1Black),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText('${LanguageConstants.installment.tr}#',
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('01-Feb-2023')),
          ]),
        ),
        AppUtility.heightBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText(LanguageConstants.pendingAmount.tr,
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('1100.86')),
          ]),
        ),
        AppUtility.heightBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText(LanguageConstants.receivedDate.tr,
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('N/A')),
          ]),
        ),
        AppUtility.heightBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText(LanguageConstants.receivedAmount.tr,
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('1100.86')),
          ]),
        ),
        AppUtility.heightBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText(LanguageConstants.financeReference.tr,
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('N/A')),
          ]),
        ),
        AppUtility.heightBox,
      ],
    );
  }
}

class FakeTileThree extends StatelessWidget {
  const FakeTileThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(horizontal: 14.0),
      title: KText(
        '${LanguageConstants.serviceProcured.tr}: ',
        style:
            AppTextTheme.bodyText1Primary.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: KText(LanguageConstants.socialFinanceLoanInternet.tr,
          style: AppTextTheme.bodyText1Black),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText('${LanguageConstants.installment.tr}#',
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('01-Feb-2023')),
          ]),
        ),
        AppUtility.heightBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText(LanguageConstants.pendingAmount.tr,
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('1100.86')),
          ]),
        ),
        AppUtility.heightBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText(LanguageConstants.receivedDate.tr,
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('N/A')),
          ]),
        ),
        AppUtility.heightBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText(LanguageConstants.receivedAmount.tr,
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('1100.86')),
          ]),
        ),
        AppUtility.heightBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: mainColor.value.withOpacity(0.05),
          ),
          child: Row(children: [
            Expanded(
                child: KText(LanguageConstants.financeReference.tr,
                    style: AppTextTheme.bodyText1Primary
                        .copyWith(fontWeight: FontWeight.bold))),
            const Expanded(child: KText('N/A')),
          ]),
        ),
        AppUtility.heightBox,
      ],
    );
  }
}

class _DetailScreen extends StatelessWidget {
  const _DetailScreen({Key? key}) : super(key: key);

  // final ServiceSetupModel serviceSetupModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(LanguageConstants.detailView.tr),
      ),
      body: CurvedBoxDecoration(
        child: ListView(
          children: const [
            _KTile(),
            AppUtility.heightBox,
            _KTile(),
            AppUtility.heightBox,
            _KTile(),
          ],
        ),
      ),
    );
  }
}

class _KTile extends StatelessWidget {
  const _KTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .restorablePush(AppUtility.dialogBuilderTwo, arguments: {
          'title': LanguageConstants.hajjLoan.tr,
          'installmentDate': '1-feb-2022',
          'amount': '110.500',
          'receivedDate': '23-may-2024',
          'receivedAmount': '105.25',
          'financeReference': '06-2022-03',
        });
      },
      child: Container(
        height: 96,
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: AppColor.grey[200]!, width: 0.4),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[200]!,
                  offset: const Offset(0, 2),
                  spreadRadius: 6.0,
                  blurRadius: 5.0)
            ]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                color: mainColor.value.withOpacity(0.5),
                width: 80,
                child: const Image(image: ImageString.hajjLoan),
              ),
            ),
            const SizedBox(width: 24.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KText(LanguageConstants.hajjLoan.tr,
                      style: AppTextTheme.bodyText1Black
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 18)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: KText(
                            LanguageConstants.startDate.tr,
                            style: AppTextTheme.bodyText1Primary
                                .copyWith(fontWeight: FontWeight.bold),
                          )),
                          const KText('01-jan-2023'),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: KText(
                            LanguageConstants.endDate.tr,
                            style: AppTextTheme.bodyText1Primary
                                .copyWith(fontWeight: FontWeight.bold),
                          )),
                          const KText('01-March-2023'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return Material(
    //   child: ListTile(
    //     contentPadding: const EdgeInsets.only(right: 16.0),
    //     // tileColor: AppColor.primary.withOpacity(0.5),
    //     leading: CircleAvatar(
    //         backgroundImage: const Image(image: ImageString.hajjLoan).image,
    //         radius: 40,
    //         backgroundColor: AppColor.black),
    //     title: KText('Hajj Loan',
    //         style: AppTextTheme.bodyText1Black
    //             .copyWith(fontWeight: FontWeight.bold)),
    //     subtitle: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Row(
    //           children: [
    //             Expanded(
    //                 child: KText(
    //               'Start Date:',
    //               style: AppTextTheme.bodyText1Primary
    //                   .copyWith(fontWeight: FontWeight.bold),
    //             )),
    //             KText('01-jan-2023'),
    //           ],
    //         ),
    //         Row(
    //           children: [
    //             Expanded(
    //                 child: KText(
    //               'End Date:',
    //               style: AppTextTheme.bodyText1Primary
    //                   .copyWith(fontWeight: FontWeight.bold),
    //             )),
    //             KText('01-March-2023'),
    //           ],
    //         ),
    //       ],
    //     ),
    //     onTap: () {
    //       Navigator.of(context)
    //           .restorablePush(AppUtility.dialogBuilderTwo, arguments: {
    //         'title': 'Hajj Loan',
    //         'installmentDate': '1-feb-2022',
    //         'amount': '110.500',
    //         'receivedDate': '23-may-2024',
    //         'receivedAmount': '105.25',
    //         'financeReference': '06-2022-03',
    //       });
    //     },
    //   ),
    // );
  }
}
