import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  const InformationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("MART"),
                SizedBox(height: 10,),
                Text("the best place to buy"), SizedBox(height: 10,),
                Text("We have all kinds of products available in the store"), SizedBox(height: 10,),
                Text("We also serve international products as well"), SizedBox(height: 10,),
                Text("as compare to other sites we provide the best"), SizedBox(height: 10,),
              ],
            ),
          ),
          Spacer(),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("CONTACT US"), SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.phone),
                    Text("+91 1234567890")
                  ],
                ), SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.email),
                    Text("prasa@gmail.com")
                  ],
                ), SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.gps_fixed),
                    Text("Andhra Pradesh, India")
                  ],
                ), SizedBox(height: 10,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
