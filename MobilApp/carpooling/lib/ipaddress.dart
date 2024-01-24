import 'package:carpooling/SizeConfig.dart';
import 'package:carpooling/theme.dart';
import 'package:carpooling/webview_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ippage extends StatefulWidget {
  const ippage({Key? key}) : super(key: key);

  @override
  State<ippage> createState() => _ippageState();
}

class _ippageState extends State<ippage> {
  final ipcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightgray,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: 20, left: 20, top: SizeConfig.widthMultiplier * 50),
              child: TextField(
                controller: ipcontroller,
                decoration: const InputDecoration(
                    labelText: 'Enter IP address',
                    labelStyle: TextStyle(
                      color: Colors.pinkAccent,
                    ),
                    hintText: 'Enter Your IP address'),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 15),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  if (ipcontroller.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: "Enter ip address",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: SizeConfig.widthMultiplier * 4,
                    );
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewWidget(
                                url: "http://" +
                                    ipcontroller.text +
                                    "user_index")));
                  }
                },
                child: const Text("Done"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';


// class ippage extends StatefulWidget {
//   const ippage({ Key? key }) : super(key: key);

//   @override
//   State<ippage> createState() => _ippageState();
// }

// class _ippageState extends State<ippage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[800],
//           body: new ListView  (
//       children: <Widget>[
//         new Card(
//           child: new Container(
//             padding: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
//             child: new Row(
//               children: <Widget>[
//                 new Container(
//                   padding: new EdgeInsets.only(right: 24.0),
//                   child: new CircleAvatar(
//                     backgroundColor: new Color(0xFFF5F5F5),
//                     radius: 16.0,
//                   )
//                 ),
//                 Flexible(
//                   child: new Container(
//                     padding: new EdgeInsets.only(right: 13.0),
//                     child: new Text(
//                       'Text largeeeeeeeeeeeeeeeee',
//                               overflow: TextOverflow.ellipsis,
//                       style: new TextStyle(
//                         fontSize: 13.0,
//                         fontFamily: 'Roboto',
//                         color: new Color(0xFF212121),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 new Container(
//                   child: new Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       new Row(
//                         children: <Widget>[
//                           new Text(
//                             'Bill  ',
//                             style: new TextStyle(
//                               fontSize: 12.0,
//                               fontFamily: 'Roboto',
//                               color: new Color(0xFF9E9E9E)
//                             ),
//                           ),
//                           new Text(
//                             '\$ -999.999.999,95',
//                             style: new TextStyle(
//                               fontSize: 14.0,
//                               fontFamily: 'Roboto',
//                               color: new Color(0xFF212121)
//                             ),
//                           ),
//                         ],
//                       ),
//                       new Row(
//                         children: <Widget>[
//                           new Text(
//                             'Limit  ',
//                             style: new TextStyle(
//                               fontSize: 12.0,
//                               fontFamily: 'Roboto',
//                               color: new Color(0xFF9E9E9E)
//                             ),
//                           ),
//                           new Text(
//                             'R\$ 900.000.000,95',
//                             style: new TextStyle(
//                               fontSize: 14.0,
//                               fontFamily: 'Roboto',
//                               color: new Color(0xFF9E9E9E)
//                             ),
//                           ),
//                         ],
//                       ),
//                     ]
//                   )
//                 )
//               ],
//             ),
//           )
//         ),
//       ]
//     )
//   );

  
//   }
// }