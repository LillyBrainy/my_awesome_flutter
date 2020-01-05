import 'package:flutter/material.dart';
import 'package:my_awesome_app/AuthStore.dart';
import 'package:provider/provider.dart';
import 'package:my_awesome_app/PostStore.dart';
 class HomeFeedPage extends StatefulWidget {
   @override
   _HomeFeedPageState createState() => _HomeFeedPageState();
 }

 class _HomeFeedPageState extends State<HomeFeedPage> {
   @override
   void initState() {
     super.initState();

   Future.delayed(Duration(seconds: 0)).then((value) {
      Provider.of<PostStore>(context, listen: false).handleFetchPosts();
    });

         }
       @override
   Widget build(BuildContext context) {
        final PostStore postStore = Provider.of<PostStore>(context);
        final AuthStore authStore = Provider.of<AuthStore>(context);
     return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
       title: Text('Home Feed' ,style: TextStyle(
         color: Colors.white
       ),),

         backgroundColor: Theme.of(context).primaryColorDark,
         actions: <Widget>[
           IconButton(
             icon: const Icon(Icons.track_changes, color: Colors.white,),
             tooltip: 'Show Snackbar',
             onPressed: () async {
               await authStore.logoutUser();
               Navigator.pushReplacementNamed(context, "/home");
             },
           ),
         ],
     ),
         body: ListView.separated(
         padding: const EdgeInsets.all(8),
             itemCount: postStore.posts.length,
         itemBuilder:(BuildContext context, int index) {


      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            
            Image(
              image: NetworkImage(postStore.posts[index]['image']),


            ),
            Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(postStore.posts[index]['caption'],
                    style: TextStyle(color: Color(0xFF7D7D7D)),),
                )
            ),
          ],
        ),
      );


         },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
       ),


     );
   }
 }

