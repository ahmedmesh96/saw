import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';
import '../widget/body_following.dart';
import '../widget/followers.dart';



class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({super.key});

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {

  bool isfollow = true;
    Map userData = {};
  bool isLoading = true;
  int? followers;
  late int following;
  late int postCount;
  late bool showFollow;
List followersList = [];
  

    getData() async {
    setState(() {
      isLoading = true;
    });
    // get Data from DB
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('userSSS')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      userData = snapshot.data()!;

      followers = userData['followers'].length;
      following = userData["following"].length;
      followersList = userData['followers'];


      
      

      
    } catch (e) {
      print(e.toString());
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    
  }
  



  

  

  


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final allDataFromDB = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 35, 40, 113),
              Color.fromARGB(255, 14, 15, 34)
            ],
          ),
        ),
        child: SafeArea(
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: false,
                title: SizedBox(
                    width: screenWidth > 600
                        ? screenWidth * 0.25
                        : screenWidth * 0.35,
                    child: const FittedBox(child: Text("My Connections"))),
                backgroundColor: Colors.transparent,
                elevation: 0,
                bottom: TabBar(tabs: [
                  Tab(
                    child: SizedBox(
                        width: screenWidth > 600
                            ? screenWidth * 0.13
                            : screenHeight * 0.09,
                        child: const FittedBox(child: Text("Followers"))),
                  ),
                  Tab(
                    child: SizedBox(
                        width: screenWidth > 600
                            ? screenWidth * 0.13
                            : screenHeight * 0.09,
                        child: const FittedBox(child: Text("Following"))),
                  ),
                  Tab(
                    child: SizedBox(
                        width: screenWidth > 600
                            ? screenWidth * 0.13
                            : screenHeight * 0.09,
                        child: const FittedBox(child: Text("Suggestion"))),
                  ),
                ]),
              ),
              body: 
              TabBarView(children: [
                ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: followers,
              itemBuilder: (BuildContext context, int index) {
                return     const FollowersDesgin();}),
                const Center(child: Text("hab"),),
              
              
                
                SizedBox(
                  // color: Colors.amber,
                
                  child: 
                  StreamBuilder<QuerySnapshot>(
                    
                    stream: 
                    FirebaseFirestore.instance
                        .collection('userSSS')
                        // .orderBy("datePublished", descending: true)
                        // .doc('uid')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Colors.white,
                        ));
                      }
                
                      return ListView(
                        
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return BodyFollowingDesign(
                            data: data,
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              
              
                
                // FollowersScreen(uiddd: FirebaseAuth.instance.currentUser!.uid,),
                // FollowingScreen(uiddd: FirebaseAuth.instance.currentUser!.uid,),
              ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
