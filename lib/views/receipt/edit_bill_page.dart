import 'package:flutter/material.dart';
import '../../layout.dart';
import '../../colors.dart';
import '../../components/input_outline.dart';
import 'widget/value_input.dart';
import '../../components/button.dart';
import './scanned_page.dart';

class CardBill extends StatelessWidget {
  const CardBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
      decoration: BoxDecoration(
        color: CustomColors.Blue50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 10,
        children: [
          Row(
            spacing: 10,
            children: [
              SizedBox(
                width: 45,
                child: InputOutline(
                  controller: TextEditingController(text: "1"),
                  center: true,
                ),
              ),
              Expanded(
                child: InputOutline(
                  controller: TextEditingController(text: "Mie Gacoan Lvl 1"),
                ),
              ),
            ],
          ),
          Row(
            spacing: 10,
            children: [
              SizedBox(width: 45),
              Expanded(
                child: InputOutline(
                  controller: TextEditingController(text: "Rp10.000"),
                ),
              ),
            ],
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Discard',
                style: TextStyle(
                  color: CustomColors.Blue700,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditBillPage extends StatefulWidget {
  const EditBillPage({super.key});

  @override
  State<EditBillPage> createState() => _EditBillPageState();
}

class _EditBillPageState extends State<EditBillPage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Edit Bill',
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              for (var i = 0; i < 5; i++) CardBill(),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.white,
                    foregroundColor: CustomColors.Blue500,
                    side: const BorderSide(
                      color: CustomColors.Blue200,
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Handle save action
                  },
                  child: const Text('Add Item'),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: CustomColors.Blue50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  spacing: 10,
                  children: [
                    ValueInput(title: 'Subtotal', value: 'Rp1.000'),
                    ValueInput(title: 'Pajak', value: 'Rp1.000'),
                    ValueInput(title: 'Service', value: 'Rp1.000'),
                    ValueInput(title: 'Discount', value: 'Rp1.000'),
                    ValueInput(title: 'Others', value: 'Rp1.000'),
                    ValueInput(title: 'Total', value: 'Rp1.000'),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ButtonCustom(
                  label: 'Confirm Bill',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScannedReceipt()),
                    );
                  },
                  type: ButtonType.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
