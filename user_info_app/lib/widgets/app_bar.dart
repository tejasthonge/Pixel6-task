


import 'package:flutter/material.dart';
import 'package:user_info_app/constants/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{   //her we must have to implemet the PreferdSized Widget the resion of we theis MyAppBar widget accaseing in the othe sacffold so it got error 

  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,   //by using this we can remove fadding 
      scrolledUnderElevation: 0, //by using this we can remove scrolling time fadding 
      toolbarHeight: 60, //this we can addjut this is the height of the app bar
      leadingWidth: 80, // to display the the logo perfectly ce increase the width of the app bar
      leading: Padding(

        padding: const EdgeInsets.only(left: 8.0),
        child: Image.network(
          logoURl  // we are creting the constatns file  and inside that we are storing globle varaibles directlu as like this file this is our compny logo  url
        ),
      ),
      actions: [ 
        IconButton(onPressed: (){

          //here we implemet logic according to our convention 
        }, icon: Icon(Icons.menu))
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);  //this method is must have to override otherwise it got error 
}
