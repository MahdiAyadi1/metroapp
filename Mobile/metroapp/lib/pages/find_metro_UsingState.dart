// // ignore_for_file: prefer_const_constructors, avoid_print, unused_element, unused_field, non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:metroapp/components/myvariables.dart';
// import 'package:geolocator/geolocator.dart';
// import '../components/appbar.dart';

// class Findmetro extends StatefulWidget {
//   String? selectLigne;
//   String? selectStationDepart;
//   List<Map>? stationsFiltredMap;
//   Findmetro(String l, String s, List<Map> liste,{super.key})
//   {
//     selectLigne=l;
//     selectStationDepart=s;
//     stationsFiltredMap=liste;
//   }

//   @override
//   State<Findmetro> createState() => _FindmetroState();
// }

// class _FindmetroState extends State<Findmetro> {
//   Position? _position;
//   double? _distance;


//   Future<void> getPositionAndDistance(double latitude,double longitude)async {
//   try {
//     await Geolocator.checkPermission();
//     await Geolocator.requestPermission();
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//           setState(() {
//           // _longitude = position.longitude;
//           _position = position;
//         });
//         double distanceInMeters = Geolocator.distanceBetween(
//         position.latitude,
//         position.longitude,
//         latitude,
//         longitude,
//       );
//       setState(() {
//           _distance = distanceInMeters;});
//       } catch (e) {
//       print(e);
//     }
//     }
    
  
//   @override
//   Widget build(BuildContext context) {

//     // Future<void> distanceBetween(Position from, Position to) async {
//     // final distanceInMeters = await Geolocator.distanceBetween(
//     //   from.latitude,
//     //   from.longitude,
//     //   to.latitude,
//     //   to.longitude,
//     // );
//     //  setState(() {
//     //       _distance = distanceInMeters;
//     //  });
     
//     // }

//     if(widget.selectStationDepart == "Plus proche de ma position"){
//       // widget.selectStationDepart="Proche";
//       // getPositionAndDistance(37.806389,10.181667);
//       // // print("hi");
//       // double? first_distance = _distance;
      
//       // print("first distance: $first_distance");
//         Future.forEach(widget.stationsFiltredMap!, (station) async {
//         getPositionAndDistance(station["coordinates"][0],station["coordinates"][1]);
//         print("distaaaance: $_distance");
//       });
//     }

//     // print("positionnn: $_position");
//     // print("distanceee: $_distance");
    
    
//     return SafeArea(
//       child: Scaffold(
//         appBar: MyAppBar(text: "Find metro Page"),
//         body: ListView(
//       // ignore: prefer_const_literals_to_create_immutables
//       children: [
//         ListTile(
//           contentPadding: EdgeInsets.fromLTRB(15, 35, 15, 35),
//           title: Text("Votre station : ${widget.selectStationDepart}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: MyVariables.secondColor),),
//           // trailing: Text("Arrive dans 5 minutes",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400,)),
//           subtitle: Text("Vous arrivez dans 4 minutes $_distance",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: MyVariables.secondColor))
//           // subtitle: Text("$_longitude",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: MyVariables.secondColor))
//         ),
          
//           Card(
//             color: Color.lerp(MyVariables.mainColor, MyVariables.backgroundColor, 0.6),
//             // color: Color.lerp(MyVariables.mainColor, MyVariables.backgroundColor, 0.6),
            
//             // shadowColor: MyVariables.mainColor,
//             child: ListTile(
//               contentPadding: EdgeInsets.fromLTRB(15, 35, 15, 35),
//               title: Text("Metro 1",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
//               trailing: Text("Arrive dans 5 minutes",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400,)),
//               subtitle: Text("Dans 20-Mars",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
//             ),
//           ),
          
//           Card(
//             color: Color.lerp(MyVariables.mainColor, MyVariables.backgroundColor, 0.6),
            
//             // shadowColor: MyVariables.mainColor,
//             child: ListTile(
//               contentPadding: EdgeInsets.fromLTRB(15, 35, 15, 35),
//               title: Text("Metro 2",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
//               trailing: Text("Arrive dans 10 minutes",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),
//               subtitle: Text("Dans Denden",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
//             ),
//           ),
          
//           Card(
//             color: Color.lerp(MyVariables.mainColor, MyVariables.backgroundColor, 0.6),
            
//             // shadowColor: MyVariables.mainColor,
//             child: ListTile(
//               contentPadding: EdgeInsets.fromLTRB(15, 35, 15, 35),
//               title: Text("Metro 3",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
//               trailing: Text("Arrive dans 25 minutes",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),
//               subtitle: Text("Dans Manouba",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
//             ),
//           ),
          
        
//       ],
//     )
//       ),
//     );
//   }
// }