// import 'package:flutter/material.dart';
//
// import 'home.dart';
// class Postcard extends StatefulWidget {
//   const Postcard({super.key});
//
//   @override
//   State<Postcard> createState() => _PostcardState();
// }
//
// class _PostcardState extends State<Postcard> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
//               .copyWith(right: 0),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 23,
//                 backgroundImage: NetworkImage(
//                     "https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg"),
//               ),
//               Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 8),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "userName",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     ),
//                   )),
//               IconButton(
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) => Dialog(
//                         child: ListView(
//                             padding:
//                             const EdgeInsets.symmetric(vertical: 16),
//                             shrinkWrap: true,
//                             children: [
//                               'Delete',
//                             ]
//                                 .map((e) => InkWell(
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 12, horizontal: 16),
//                                 child: Text(e),
//                               ),
//                             ))
//                                 .toList()),
//                       ),
//                     );
//                   },
//                   icon: const Icon(Icons.more_vert))
//             ],
//           ),
//         ),
//         SizedBox(
//             height: h * 0.35,
//             width: double.infinity,
//             child: Image(
//               image: NetworkImage(
//                 "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg?q=10&h=200",
//               ),
//               fit: BoxFit.cover,
//             )),
//         Row(
//           children: [
//             IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.favorite,
//                   color: Colors.red,
//                 )),
//             IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.comment_outlined,
//                 )),
//             IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.send  ,
//                 )),
//             Expanded(child: Align(
//                 alignment: Alignment.bottomRight,
//                 child: IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border))
//             ))
//           ],
//         ),
//         Container(
//           padding: const EdgeInsets.symmetric(
//               horizontal: 16
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("1,610 likes",style: Theme.of(context).textTheme.bodyMedium,),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.only(
//                     top: 8
//                 ),
//                 child: RichText(
//                   text: TextSpan(
//                       style: const TextStyle(color: Colors.black),
//                       children: [
//                         TextSpan(
//                             text: 'username',
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                             )
//                         ),
//                         TextSpan(
//                             text: ' Hey guys description'
//                         )
//                       ]
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: (){},
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(vertical: 4),
//                   child: Text('View all 100 comments',
//                     style:TextStyle(fontSize: 13,color: Colors.grey) ,),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 2),
//                 child: Text('9/08/2023',
//                   style:TextStyle(fontSize: 13,color: Colors.grey) ,),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
