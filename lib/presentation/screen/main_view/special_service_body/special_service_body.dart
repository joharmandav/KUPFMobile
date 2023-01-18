import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf_mobile/app_utility/app_color.dart';
import 'package:kupf_mobile/app_utility/app_text_theme.dart';
import 'package:kupf_mobile/app_utility/image_string.dart';
import 'package:kupf_mobile/widgets/k_text.dart';
import '../../../../widgets/loading.dart';
import '../../../controller/offers/offer_controller.dart';
import '../../../models/offers_model.dart';

class SpecialServices extends StatelessWidget {
  const SpecialServices({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OfferController());
    return Obx(() {
      if (controller.offersList.isEmpty && controller.isLoading) {
        return const LoadingWidget();
      } else if (controller.offersList.isEmpty && !controller.isLoading) {
        return const Center(child: Text("No Offer Found"));
      }
      return ListView.builder(
        itemCount: controller.offersList.length,
        itemBuilder: (context, index) {
          OffersModel offer = controller.offersList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Material(
              child: ListTile(
                //tileColor: AppColor.primary.withOpacity(0.1),
                leading: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Image(image: ImageString.tooth),
                ),
                title: KText(offer.offer,
                    style: AppTextTheme.bodyText1grey
                        .copyWith(fontWeight: FontWeight.bold)),
                // subtitle: Text('${tooth.kuwaitDinar} KWD',
                //     style: AppTextTheme.bodyText1grey
                //         .copyWith(fontWeight: FontWeight.bold)),
                //subtitle:Text(),
                onTap: () {
                  // Navigator.of(context)
                  //     .restorablePush(AppUtility.dialogBuilder, arguments: {
                  //   'title': tooth.serviceName,
                  //   'price':tooth.kuwaitDinar,
                  //   'startTime':tooth.startTime.toString().split(' ').first,
                  //   'endTime':tooth.endTime!.toString().split(' ').first,
                  //   'discountPrice':tooth.discountPrice
                  // });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: mainColor.value)),
              ),
            ),
          );
        },
      );
    });
  }
}

class ToothService {
  final String serviceName;
  final double kuwaitDinar;
  final double? discountPrice;
  final DateTime? startTime;
  final DateTime? endTime;

  ToothService(
      {required this.serviceName,
      required this.kuwaitDinar,
      this.startTime,
      this.endTime,
      this.discountPrice})
      : assert(discountPrice == null || discountPrice >= 0.0);

  static List<ToothService> listOfServices = [
    ToothService(
        serviceName: 'Tooth Implanting',
        kuwaitDinar: 220,
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(days: 100)),
        discountPrice: 0.1),
    ToothService(
        serviceName: 'Esthetic filling starting',
        kuwaitDinar: 35,
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(days: 1)),
        discountPrice: 0.1),
    ToothService(
        serviceName: 'Displaced tooth starting ',
        kuwaitDinar: 55,
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(days: 7)),
        discountPrice: 0.1),
    ToothService(
        serviceName: 'porcelain crown',
        kuwaitDinar: 95,
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(days: 8)),
        discountPrice: 0.15),
    ToothService(
        serviceName: 'Zircon crown',
        kuwaitDinar: 115,
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(days: 74)),
        discountPrice: 0.29),
    ToothService(
        serviceName: 'Endodontics Anterior tooth',
        kuwaitDinar: 80,
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(days: 80)),
        discountPrice: 0.19),
    ToothService(
        serviceName: 'Endodontics for molar',
        kuwaitDinar: 120,
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(days: 14)),
        discountPrice: 0.27),
    ToothService(
        serviceName: 'Hollywood Smile 16 tooth –transparent Emax',
        kuwaitDinar: 1600,
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(days: 2)),
        discountPrice: 0.17),
    ToothService(
        serviceName: 'Hollywood Smile 8 tooth –Feneer or zircon',
        kuwaitDinar: 790,
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(days: 40)),
        discountPrice: 0.21),
    ToothService(
        serviceName: 'Hollywood Smile 8 tooth –Feneer or zircon',
        kuwaitDinar: 790,
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(days: 400)),
        discountPrice: 0.75),
    ToothService(
        serviceName:
            'Hollywood Smile 20 tooth –Feneer or zircon +cleaning + filling',
        kuwaitDinar: 1800,
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(days: 4)),
        discountPrice: 0.05),
  ];
}
