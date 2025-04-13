import 'package:flutter/material.dart';
import '../../layout.dart';
import './widget/recipient.dart';
import '../../colors.dart';
import '../receipt/widget/value_text.dart';
import '../../components/button.dart';

class CardItem extends StatefulWidget {
  const CardItem({super.key});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.Blue50,
        borderRadius: BorderRadius.circular(10),
        border:
            isChecked == true ? Border.all(color: CustomColors.Blue500) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              SizedBox(
                width: 45,
                child: Checkbox(
                  side: const BorderSide(color: CustomColors.Blue500),
                  activeColor: CustomColors.Blue500,
                  tristate: true,
                  value: isChecked,
                  // fillColor: CustomColors.Blue500,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Mie Gacoan Lvl 1"), Text("1x")],
                ),
              ),
              Expanded(child: Text("Rp10.000", textAlign: TextAlign.end)),
            ],
          ),
          SingleChildScrollView(
            child: Row(
              spacing: 0,
              children: [
                isChecked == true
                    ? Expanded(
                      child: Container(
                        height: 35,
                        child: Stack(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Positioned(
                                top: 0,
                                left: i * 20,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: CustomColors.Blue500,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      'https://i.pinimg.com/736x/10/c0/02/10c00261d6c19cc605c13bc2a2a78fdc.jpg',
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    )
                    : Container(),
                isChecked == true
                    ? SizedBox(
                      child: OutlinedButton(
                        style: FilledButton.styleFrom(
                          // backgroundColor: Colors.white,
                          foregroundColor: CustomColors.Blue500,
                          side: const BorderSide(
                            color: CustomColors.Blue500,
                            width: 1,
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Split bill'),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: CustomColors.Blue500,
                            ),
                          ],
                        ),
                      ),
                    )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SplitBillPage extends StatefulWidget {
  const SplitBillPage({super.key});

  @override
  State<SplitBillPage> createState() => _SplitBillPageState();
}

class _SplitBillPageState extends State<SplitBillPage> {
  Future<void> _openDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: CustomColors.Blue50,
          content: SizedBox(
            height: 181,
            child: Column(
              spacing: 10,
              children: [
                Text(
                  'Transfer Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: TextField(
                    expands: true,
                    minLines: null,
                    maxLines: null,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'Ex: BCA - 1212675218',
                      hintStyle: TextStyle(color: CustomColors.Blue300),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CustomColors.Blue500),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CustomColors.Blue500),
                      ),
                      filled: true,
                      fillColor: CustomColors.Blue50,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ButtonCustom(
                    label: 'Complete',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    type: ButtonType.primary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Split Bill',
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    for (var i = 0; i < 5; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Recipient(),
                      ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: OutlinedButton(
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: Colors.white,
                          foregroundColor: CustomColors.Blue500,
                          side: const BorderSide(
                            color: CustomColors.Blue200,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        onPressed: () {
                          // Handle save action
                        },

                        child: Icon(
                          Icons.add_circle_outline,
                          color: CustomColors.Blue500,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DefaultTabController(
                initialIndex: 1,
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                        color: CustomColors.Blue200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tabs: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(30, 13, 30, 13),
                          child: Text(
                            'Custom Split',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: CustomColors.Blue500),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(30, 13, 30, 13),
                          child: Text(
                            'Equal Split',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: CustomColors.Blue500),
                          ),
                        ),
                      ],
                      labelColor: CustomColors.Blue500,
                      dividerHeight: 0,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                            child: Column(
                              spacing: 10,
                              children: [
                                for (var i = 0; i < 5; i++) CardItem(),
                                SizedBox(height: 15),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: CustomColors.Blue50,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    spacing: 5,
                                    children: [
                                      ValueText(
                                        title: 'Total',
                                        value: 'Rp10.000',
                                        bold: true,
                                      ),
                                      ValueText(
                                        title: 'Pajak',
                                        value: 'Rp10.000',
                                      ),
                                      ValueText(
                                        title: 'Service',
                                        value: 'Rp10.000',
                                      ),
                                      ValueText(
                                        title: 'Discount',
                                        value: 'Rp10.000',
                                      ),
                                      ValueText(
                                        title: 'Others',
                                        value: 'Rp10.000',
                                      ),
                                      ValueText(
                                        title: 'Total',
                                        value: 'Rp10.000',
                                        bold: true,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                SizedBox(
                                  width: double.infinity,
                                  child: ButtonCustom(
                                    label: 'Continue',
                                    onPressed: () {
                                      _openDialog(context);
                                    },
                                    type: ButtonType.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(child: Text("Isi Tab 2")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
