import 'package:flutter/material.dart';

class Recipient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/10/c0/02/10c00261d6c19cc605c13bc2a2a78fdc.jpg',
              ),
            ),
          ),

          Text(
            'Hume',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
