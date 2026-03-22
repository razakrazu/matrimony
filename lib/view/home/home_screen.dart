import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimony_app/controller/login_signup/login_signup.dart';
import 'package:matrimony_app/controller/user_details/sarvice.dart';
import 'package:matrimony_app/model/user_details/user_details.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
 final FirebaseAuth auth = FirebaseAuth.instance;
 final AuthController controller = Get.put(AuthController());
 final UserSarvices sarviceController = UserSarvices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
           await controller.signOut();
          },
          icon: Icon(Icons.logout),
        ),
      ),
      body:FutureBuilder<List<UserDetailsModel>>(
        future:sarviceController.getAllUser(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
             return const Center(child: CircularProgressIndicator());
          }
            if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          // 📭 Empty state
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No Profiles Found"));
          }
                    List<UserDetailsModel> users = snapshot.data!;

          return  Padding(
                    padding: const EdgeInsets.all(12),
                    child: GridView.builder(
                      
                      scrollDirection: Axis.vertical,
                      itemCount: users.length,
                      
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.5,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage("lib/assets/photos.avif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
        
         
            InkWell(
              onTap: () {
                
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
        
           
            Positioned(
              bottom: 15,
              left: 12,
              right: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
                  const Text(
                    "Rahul S.,27",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        
                  const SizedBox(height: 4),
        
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "85%",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
        
                  const SizedBox(height: 4),
        
                  const Text(
                    "Civil Engineer",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
        
                  const Text(
                    "Kochi, Kerala",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
        
          
            Positioned(
              bottom: 15,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.favorite_border,
                  size: 20,
                ),
              ),
            )
          ],
        ),
            );
                      },
                    ),
                    
                                  );
        },
        
       
      ),);
        //  ListView(
        //   children: [
        //     auth.currentUser!.emailVerified
        //         ? SizedBox(height: 1,)
        //         : Text('${auth.currentUser!.email}  not verifiyed'),
        //     SizedBox(height: 100),
        //     Text(auth.currentUser!.email!),
        //     Text(
        //       auth.currentUser!.emailVerified
        //           ? 'email verifyed'
        //           : 'email not veryfied',
        //     ),
        //   ],
        // ),
      
    
  }
//    Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//      appBar: AppBar(leading: IconButton(onPressed: ()async{
// await controller.signOut();

//      }, icon: Icon(Icons.logout)),),
//       body:   Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: GridView.builder(
//                     scrollDirection: Axis.vertical,
//                     itemCount: 10,
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 12,
//                       childAspectRatio: 0.5,
//                     ),
//                     itemBuilder: (context, index) {
//                       return const ProfileCard();
//                     },
//                   ),
                  
//                                 ),

//     );
//   }
}


