import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_6week25/app_bar_features.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiComponents extends StatefulWidget {
  const UiComponents({super.key});

  @override
  State<UiComponents> createState() => _UiComponentsState();
}

class _UiComponentsState extends State<UiComponents> {
  final TextEditingController _controller = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI Components"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        leading: Icon(Icons.menu_book),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.more_vert))
        ],

      ),
      body:
          SafeArea(child:
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('assets/images/img.png'),width: MediaQuery.of(context).size.width * 0.4,),
                      Image.network("https://picsum.photos/seed/picsum/200/300",width: MediaQuery.of(context).size.width *0.4),

                    ],
                  ),
                  // Image.asset('assets/images/img.png'),  WORKING

                  // Image.asset('assets/images/img.png"',
                  //     height: 50,alignment: Alignment.center), NOT Working

                  Text(
                    "Enter Details here",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.alphaBlend(Colors.cyan, Colors.black),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        labelText: "Enter name",
                        border: OutlineInputBorder(),
                        errorText: _validate?"Name Value required":null
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        labelText: "Enter Email",
                        border: OutlineInputBorder(),
                        errorText: _validate ? "Email Value required":null
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        labelText: "Enter Contact",
                        border: OutlineInputBorder(),
                        errorText: _validate ? "Contact Value required":null

                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilledButton(onPressed: () {
                        setState(() {
                          _controller.text.isEmpty?_validate = true :_validate=false;
                        });

                      }, child: Text("Validate Fields")),
                      SizedBox(width: 10),
                      Text("Filled Button"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed:
                            () => {
                          Fluttertoast.showToast(msg: "This is my flutter toast"),
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AppBarFeatures()))
                        },
                        child: Text("Appbar Screen"),
                      ),
                      SizedBox(width: 10),
                      Text("Elevated Button"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed:
                            ()=>{
                          if (_controller.text.isEmpty)
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Enter data correctly")),
                              ),
                            },
                        },
                        child: Text("Show Snackbar"),
                      ),
                      SizedBox(width: 10),
                      Text("Outlined Button"),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     TextButton(
                  //       onPressed: ()=> {
                  //         _showMyDialog(context)
                  //       },
                  //       child: Text("Show Alert through function"),
                  //     ),
                  //     SizedBox(width: 10),
                  //     Text("Text Button"),
                  //   ],
                  // ),
                  // SizedBox(height: 10),
                  // Row(mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     FilledButton.tonal(onPressed: ()=>{
                  //       Navigator.push(context, MaterialPageRoute(builder: (context)=> MyFormFields()))
                  //     },
                  //         child: Text("Filled Tonal")),
                  //   ],),

                ],
              ),
            ),
          ),
          )
    );
  }
}
