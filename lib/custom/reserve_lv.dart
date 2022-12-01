// import 'package:bord/const.dart';
// import 'package:bord/home_page_tabs/reserve_tab.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import 'get_sredniy_check.dart';

// class OrganizationContainer extends StatelessWidget {
//   const OrganizationContainer({
//     Key? key,
//     required this.organizationName,
//     required this.sredniyCheck,
//     required this.kitchen,
//     required this.rating,
//     required this.ratedUsersAmount,
//     required this.imageAsseet,
//   }) : super(key: key);
//   final String organizationName;
//   final int sredniyCheck;
//   final String kitchen;
//   final double rating;
//   final int ratedUsersAmount;
//   final String imageAsseet;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const SizedBox(
//           width: 1,
//         ),
//         Container(
//           height: MediaQuery.of(context).size.height * 0.261,
//           width: MediaQuery.of(context).size.width * 0.565,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(5),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.3),
//                 spreadRadius: 1,
//                 blurRadius: 1,
//                 offset: const Offset(-1, 2),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ClipRRect(
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(5.0)),
//                 child: Image.asset(
//                   imageAsseet,
//                   fit: BoxFit.fitWidth,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     ' $organizationName',
//                     style: const TextStyle(
//                       color: Color(0xff59B433),
//                       fontWeight: FontWeight.w600,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Row(
//                   children: [
//                     getSredniyCheck(sredniyCheck),
//                     const SizedBox(
//                       width: 4,
//                     ),
//                     const Icon(
//                       Icons.circle_rounded,
//                       size: 5,
//                     ),
//                     const SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                       ' $kitchen',
//                       style: kRestaurantOpisanie,
//                     ),
//                     const SizedBox(
//                       width: 4,
//                     ),
//                     const Icon(
//                       Icons.circle_rounded,
//                       size: 5,
//                     ),
//                     const SizedBox(
//                       width: 4,
//                     ),
//                     SvgPicture.asset(
//                       'images/rating_star_icon.svg',
//                       height: 9,
//                     ),
//                     Text(
//                       ' $rating',
//                       style: kRestaurantOpisanie,
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Text(
//                       '($ratedUsersAmount)',
//                       style: kRestaurantOpisanie,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 60,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   shrinkWrap: true,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.fromLTRB(5, 5, 3, 10),
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xff06822A),
//                             elevation: 7,
//                             textStyle: const TextStyle(color: Colors.white)),
//                         child: const Text(
//                           '18:00',
//                           style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontSize: 15,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.fromLTRB(5, 5, 3, 10),
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xff06822A),
//                             elevation: 7,
//                             textStyle: const TextStyle(color: Colors.white)),
//                         child: const Text(
//                           '19:00',
//                           style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontSize: 15,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.fromLTRB(5, 5, 3, 10),
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xff06822A),
//                             elevation: 7,
//                             textStyle: const TextStyle(color: Colors.white)),
//                         child: const Text(
//                           '20:00',
//                           style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontSize: 15,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 8,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           width: 20,
//         ),
//       ],
//     );
//   }
// }
