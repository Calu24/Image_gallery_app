import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  final int? likes; 
  final String? firstName; 
  final String? lastName; 
  final String? userUrlImg; 
  const ItemDetail({
    Key? key,
    this.likes,
    this.firstName,
    this.lastName,
    this.userUrlImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final textStyle =  TextStyle(color: Colors.red[300],fontSize: 20);
    

    return GestureDetector(
      onTap: (){
        
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: FadeInImage(
                      image: NetworkImage(userUrlImg ?? 'assets/no_image.png'),
                      placeholder: const AssetImage('assets/loading.gif'),
                    ),
            ),
            const SizedBox(width: 15.0),
            Column(children: [
              Text('User Name:', style: textStyle),
              Text('$firstName', style: textStyle),
              Text('$lastName', style: textStyle),
              Text('Likes: $likes', style: textStyle),
            ],),
          ],
        ),
      ),
    );
  }
}
