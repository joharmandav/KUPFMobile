import 'package:flutter/material.dart';
import 'package:kupf/app_utility/app_color.dart';
import 'package:kupf/presentation/screen/sigin_view/sigin_view.dart';
import 'package:kupf/widgets/k_text.dart';

class ServiceDetail extends StatelessWidget {
  const ServiceDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const KText('Service List'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: AppSpacing.padding,
          child: DataTable(
            headingTextStyle: theme.bodyText1!
                .copyWith(color: Colors.blue[900]!, fontWeight: FontWeight.bold),
            columns: const [
              DataColumn(label: KText('Services Procured')),
              DataColumn(label: KText('Installment #')),
              DataColumn(label: KText('Pending Amount')),
              DataColumn(label: KText('Received Date')),
              DataColumn(label: KText('Received Amount')),
              DataColumn(label: KText('finance Reference')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(KText('Hajj Loan')),
                DataCell(KText('1 –Feb -2022')),
                DataCell(KText('110.500')),
                DataCell(KText('27-Feb-2022')),
                DataCell(KText('110.500')),
                DataCell(KText('02-2022-03')),

              ]),
              DataRow(cells: [
                DataCell(KText('Hajj Loan')),
                DataCell(KText('1 –Feb -2022')),
                DataCell(KText('110.500')),
                DataCell(KText('27-Feb-2022')),
                DataCell(KText('110.500')),
                DataCell(KText('02-2022-03')),

              ]),
              DataRow(cells: [
                DataCell(KText('Hajj Loan')),
                DataCell(KText('1 –Feb -2022')),
                DataCell(KText('110.500')),
                DataCell(KText('27-Feb-2022')),
                DataCell(KText('110.500')),
                DataCell(KText('02-2022-03')),

              ]),
              DataRow(cells: [
                DataCell(KText('Hajj Loan')),
                DataCell(KText('1 –Feb -2022')),
                DataCell(KText('110.500')),
                DataCell(KText('27-Feb-2022')),
                DataCell(KText('110.500')),
                DataCell(KText('02-2022-03')),

              ]),
              DataRow(cells: [
                DataCell(KText('Hajj Loan')),
                DataCell(KText('1 –Feb -2022')),
                DataCell(KText('110.500')),
                DataCell(KText('27-Feb-2022')),
                DataCell(KText('110.500')),
                DataCell(KText('')),

              ]),
              DataRow(cells: [
                DataCell(KText('Hajj Loan')),
                DataCell(KText('1 –Feb -2022')),
                DataCell(KText('110.500')),
                DataCell(KText('27-Feb-2022')),
                DataCell(KText('110.500')),
                DataCell(KText('')),

              ]),
              DataRow(cells: [
                DataCell(KText('Hajj Loan')),
                DataCell(KText('1 –Feb -2022')),
                DataCell(KText('110.500')),
                DataCell(KText('27-Feb-2022')),
                DataCell(KText('')),
                DataCell(KText('')),

              ]),

            ],
            border: TableBorder.all(color: mainColor.value, width: 2.0),
            headingRowColor: MaterialStateProperty.all(
                mainColor.value.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}
