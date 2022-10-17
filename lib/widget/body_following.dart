import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../firbase_services/auth.dart';
import '../models/user.dart';
import '../provider/user_provider.dart';



class BodyFollowingDesign extends StatefulWidget {
  
  final Map data;
  const BodyFollowingDesign({super.key, 
  required this.data
  });

  @override
  State<BodyFollowingDesign> createState() => _BodyFollowingDesignState();
}

class _BodyFollowingDesignState extends State<BodyFollowingDesign> {
 
  bool isfollow = true;
  late   Map allUid;
    

  
  
   






 

  
  

@override
  void initState() {
    super.initState();
    // allDataFromDB!.followers;
    
    
    
  }





  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    // final double heightScreen = MediaQuery.of(context).size.height;
    final allDataFromDB = Provider.of<UserProvider>(context).getUser;

    


              
    return 
       widget.data["uid"] == allDataFromDB!.followers  ?
       SizedBox() :
     
      Container(
            ///////
            decoration: BoxDecoration(
                // color: mobileBackgroundColor,
                // gradient: LinearGradient(colors: [
                //     Color.fromARGB(255, 38, 43, 116),
                //     Color.fromARGB(255, 14, 15, 34)
                //   ], begin: Alignment.topCenter),
                borderRadius: BorderRadius.circular(12)),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(125, 78, 91, 110)),
                            child: CircleAvatar(
                              radius: widthScreen > 600
                                  ? widthScreen * 0.06
                                  : widthScreen * 0.07,
                              backgroundImage:
                                  NetworkImage(widget.data["profileImg"]),
                            ),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          SizedBox(
                            width: widthScreen > 600
                                ? widthScreen * 0.1
                                : widthScreen * 0.12,
                            child: FittedBox(
                              child: Text(
                                widget.data['username'],
                                // style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: widthScreen > 600
                            ? widthScreen * 0.1
                            : widthScreen * 0.15,
                        child: FittedBox(
                          child: isfollow ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45))
                            ),
                            onPressed: (){
                            setState(() {
                              isfollow = false;
                              allDataFromDB.followers;
                              print(allDataFromDB.followers);
                            });
                          }, child: Text("Follow")) : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45))
                            ),
                            onPressed: (){
                            setState(() {
                              isfollow = true;
                            });
                          }, child: Text("Unfollow")),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ) 
          
          
          ;
          
        
  }

}
