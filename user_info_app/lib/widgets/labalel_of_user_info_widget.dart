

import 'package:flutter/material.dart';

class LegalOfUserWidget extends StatelessWidget {
  const LegalOfUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
       margin:
                    EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5),
      decoration:const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        ),
        border: Border(
    
          top: BorderSide(
            width: 0.5,
            color: const Color.fromARGB(
                255, 198, 191, 191),
          ),
          left:  BorderSide(
            width: 0.5,
            color: const Color.fromARGB(
                255, 198, 191, 191),
          ),
          right: BorderSide(
            width: 0.5,
            color: const Color.fromARGB(
                255, 198, 191, 191),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Text("ID",
                style: TextStyle(fontWeight: FontWeight.bold),
                ),

              ],
            ),
          ),
          Text("Image",
                style: TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Text("Full Name",
                style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Expanded(
            flex: 2,
            child: Text("Demography",
                style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Expanded(
            flex: 3,
            child: Text("Designation",
                style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Expanded(
            flex: 3,
            child: Text('Location',
                style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }}