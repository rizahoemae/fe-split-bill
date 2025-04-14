import 'package:flutter/material.dart';
import '../../layout.dart';
import '../../colors.dart';
import '../receipt/widget/horizontal_line.dart';
import '../../components/button.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Bill',
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: CustomColors.Blue100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 25,
            children: [
              Image(image: AssetImage('assets/images/yay.png')),
              Text('Yay! You made it!'),
              CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items:
                    [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    height: 350,
                                    child: OverflowBox(
                                      maxHeight: double.infinity,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                              20,
                                              50,
                                              20,
                                              0,
                                            ),
                                            width: 350,
                                            height: 350,
                                            decoration: BoxDecoration(
                                              color: CustomColors.Blue50,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              // spacing: 1,
                                              children: [
                                                Text(
                                                  'Keniro',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  '+628129102910',
                                                  style: TextStyle(
                                                    color: CustomColors.Blue500,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                HorizontalLine(),
                                                SizedBox(height: 30),
                                                Text(
                                                  'Rp10.000',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 35,
                                                    color: CustomColors.Blue500,
                                                  ),
                                                ),
                                                SizedBox(height: 30),
                                                HorizontalLine(),
                                                SizedBox(height: 10),
                                                Text(
                                                  'Share on WhatsApp?',
                                                  style: TextStyle(
                                                    color: CustomColors.Blue300,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                    'Share now on WhatsApp',
                                                    style: TextStyle(
                                                      color:
                                                          CustomColors.Blue500,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            top: -35,
                                            left: 0,
                                            right: 0,
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: CircleAvatar(
                                                radius: 35,
                                                backgroundColor:
                                                    Colors.grey[200],
                                                backgroundImage: NetworkImage(
                                                  'https://i.pinimg.com/736x/99/07/b5/9907b5e5615cb04074e93e22de629182.jpg',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
              ),

              // for (var i = 0; i < 5; i++),

              // CarouselSlider(
              //   options: CarouselOptions(
              //     height: 500,
              //     autoPlay: true,
              //     aspectRatio: 2.0,
              //     enlargeCenterPage: true,
              //     enlargeStrategy: CenterPageEnlargeStrategy.height,
              //   ),
              //   items: [

              //   ],
              // ),
              SizedBox(
                width: double.infinity,
                child: ButtonCustom(
                  label: 'Continue',
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ConfirmPage()),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
