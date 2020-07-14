// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloudwalker_launcher/data/detail_page_service/detail_page.pbgrpc.dart';
// import 'package:cloudwalker_launcher/data/tile_service/TileService.pbgrpc.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:cloudwalker_launcher/injection.dart';
// import 'package:carousel_pro/carousel_pro.dart' as CarosuelPro;

// import 'detail_page.dart';

// class MainScreen extends StatefulWidget {
//   final CloudwalkerSchedule cloudwalkerSchedule;

//   const MainScreen({Key key, @required this.cloudwalkerSchedule})
//       : super(key: key);
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   final _client = getIt<TileServiceClient>();
//   final _scrollController = ScrollController();
//   final _threshold = 100.0;
//   var _fadePercentage = 0.0;
//   bool isMobile = false;
//   Size size;
//   var scaleFactor = 1.0;
//   static bool _hoverPlay = false;
//   String currentPageName;
//   final Map<String, List<Widget>> primeMap = Map();
//   final Map<String, FocusNode> focusMap = Map();

//   @override
//   void initState() {
//     super.initState();
//     currentPageName = widget.cloudwalkerSchedule.pages.elementAt(0).pageName;
//     widget.cloudwalkerSchedule.pages.map((e) {
//       focusMap[e.pageName] = FocusNode();
//     });
//     _scrollController.addListener(() {
//       if (_scrollController.offset <= 100) {
//         setState(() {
//           final fade = _scrollController.offset / _threshold;
//           _fadePercentage = fade < 0 ? 0 : fade;
//         });
//       } else {
//         setState(() => _fadePercentage = 1.0);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     isMobile = size.width < 650;
//     final currentRange = size.width / 500;
//     final maxRange = 2.8;
//     final minRange = 1.5;

//     if (currentRange >= minRange && currentRange <= maxRange) {
//       scaleFactor = currentRange / maxRange;
//     } else if (currentRange > maxRange) {
//       scaleFactor = 1.0;
//     } else {
//       scaleFactor = 0.5;
//     }

//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: FutureBuilder<List<Widget>>(
//           future: _getRows(context, currentPageName),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Stack(children: snapshot.data);
//             } else {
//               return Center(child: CircularProgressIndicator());
//             }
//           },
//         ));
//   }

//   Future<List<Widget>> _getRows(BuildContext context, String pageName) async {
//     if (primeMap.containsKey(pageName)) {
//       return primeMap[pageName];
//     } else {
//       List<Widget> childResult = List();
//       List<Widget> result = List();
//       final pageResponse = await _client.getPage(PageRequest()
//         ..vendor = 'cvte'
//         ..brand = 'shinko'
//         ..pageName = pageName);

//       final carouselResponse = await _client.getCarousel(CarouselRequest()
//         ..vendor = 'cvte'
//         ..brand = 'shinko'
//         ..pageName = pageName);

//       childResult.add(_topSection(size, carouselResponse));

//       for (int i = 0; i < pageResponse.rowContentEndpoint.length; i++) {
//         List<String> tmp =
//             pageResponse.rowContentEndpoint.elementAt(i).split("/");
//         RowRequest req = RowRequest()
//           ..vendor = tmp[2]
//           ..brand = tmp[3]
//           ..pageName = tmp[4]
//           ..rowName = tmp[5]
//           ..rowType = tmp[6];

//         final rowResponse = await _client.getRow(req);
//         if (rowResponse != null &&
//             rowResponse.contentTiles != null &&
//             rowResponse.contentTiles.length != 0) {
//           childResult.add(_buildRow(context, rowResponse));
//         }
//       }

//       result.add(ListView.builder(
//           controller: _scrollController,
//           itemCount: childResult.length,
//           itemBuilder: (context, index) {
//             return childResult.elementAt(index);
//           }));

//       result.add(_cwAppBar(size, widget.cloudwalkerSchedule));
//       primeMap[pageName] = result;
//       return result;
//     }
//   }

//   Widget _cwAppBar(Size size, CloudwalkerSchedule data) {
//     return Container(
//       height: 60,
//       child: Stack(
//         children: [
//           AnimatedOpacity(
//             opacity: _fadePercentage == 0 ? 0 : 1,
//             duration: Duration(milliseconds: 250),
//             child: Container(
//               height: 60,
//               width: size.width,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color(0xFF060606).withOpacity(_fadePercentage),
//                     Color(0xFF141414).withOpacity(_fadePercentage),
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: appBarWidget(data),
//           ),
//         ],
//       ),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color(0xFF060606).withOpacity(0.8),
//             Color(0xFF141414).withOpacity(0.0),
//           ],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//     );
//   }

//   List<Widget> appBarWidget(CloudwalkerSchedule schedule) {
//     List<Widget> result = List();
//     result.add(SizedBox(width: 40));
//     result.add(Container(
//       width: 180,
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       child: Image.asset('assets/images/brand.png'),
//     ));
//     result.add(SizedBox(width: 50));

//     schedule.pages.forEach((element) {
//       result.add(
//         RaisedButton(
//           onPressed: () {
//             currentPageName = element.pageName;
//             setState(() {});
//           },
//           focusColor: Colors.red,
//           shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(60.0)),
//           elevation: 50,
//           padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
//           color: Colors.transparent,
//           child: Text(
//             element.pageName,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 15,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       );
//       result.add(SizedBox(width: 20));
//     });
//     return result;
//   }

//   Widget _buildRow(BuildContext context, RowResponse rowResponse) {
//     List<Widget> tiles = rowResponse.contentTiles.map((e) {
//       final imageEndpoint = e.poster != null ? e.poster : e.portrait;
//       return Row(children: [
//         _movieItem(
//             context,
//             "http://asset.s4.cloudwalker.tv/images/tiles/" + imageEndpoint,
//             e.contentId),
//         SizedBox(width: 5)
//       ]);
//     }).toList();

//     return Transform(
//       transform: Matrix4.identity()..translate(0.0, -80.0, 0.0),
//       child: Align(
//         alignment: Alignment.bottomLeft,
//         child: Container(
//           height: 180,
//           width: size.width,
//           margin: const EdgeInsets.only(bottom: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: Text(rowResponse.rowName,
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600)),
//               ),
//               SizedBox(height: 10),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: tiles.length,
//                   itemBuilder: (context, index) {
//                     return tiles.elementAt(index);
//                   },
//                   padding: const EdgeInsets.only(left: 10, right: 0),
//                   scrollDirection: Axis.horizontal,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );

//   }

//   Widget _topSection(Size size, CarouselResponse response) {
//     return SizedBox(
//         height: 400.0,
//         width: size.width,
//         child: CarosuelPro.Carousel(
//           images: response.carousel.map((e) {
//             return CachedNetworkImage(
//                 placeholder: (context, url) => Image.asset(
//                       'assets/images/brand.png',
//                       fit: BoxFit.scaleDown,
//                     ),
//                 imageUrl: "http://asset.s4.cloudwalker.tv/images/tiles/" +
//                     e.imageUrl);
//           }).toList(),
//           dotSize: 4.0,
//           dotSpacing: 15.0,
//           dotColor: Colors.black,
//           indicatorBgPadding: 5.0,
//           dotBgColor: Colors.transparent,
//           borderRadius: false,
//           dotVerticalPadding: 60.0,
//         ));
//   }

//   static Widget _movieItem(BuildContext context, String url, String contentId) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) {
//             return DetailPage(contentId, getIt<DetailPageServiceClient>());
//           }),
//         );
//       },
//       child: Container(
//         width: 260,
//         height: 150,
//         child: CachedNetworkImage(
//           imageUrl: url,
//           fit: BoxFit.cover,
//           placeholder: (context, url) => Image.asset(
//             'assets/images/brand.png',
//             fit: BoxFit.scaleDown,
//           ),
//         ),
//       ),
//     );
//   }

// }
