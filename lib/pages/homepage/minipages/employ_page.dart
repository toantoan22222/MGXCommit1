import 'package:flutter/material.dart';
import 'package:mgx_clone/services/authentication.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mgx_clone/pages/homepage/minipages/parkinglotsAdd/lots_add.dart';
import 'package:mgx_clone/pages/detail_page.dart';
class MyEmployeePage extends StatefulWidget
{
  MyEmployeePage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  @override
  _MyEmployeePageState createState() => _MyEmployeePageState();
}

class _MyEmployeePageState extends State<MyEmployeePage>
{
  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        backgroundColor: Color(0xFF2d3247),
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.contact_phone,
                color: Colors.redAccent,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage()));
              }),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.signOutAlt,
                  color: Colors.redAccent,
                  size: 30.0,
                ),
                onPressed: () {
                  _signOut();
                }),
          ],
        ),
        body: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          itemBuilder: (context,index){
            return NewEmployee();
          }
        )
    );
  }
}



class NewEmployee extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Padding
      (
      padding: EdgeInsets.only(bottom: 16.0),
      child: Stack
        (
        children: <Widget>
        [
          /// Item card
          Align
            (
            alignment: Alignment.topCenter,
            child: SizedBox.fromSize
              (
                size: Size.fromHeight(172.0),
                child: Stack
                  (
                  fit: StackFit.expand,
                  children: <Widget>
                  [
                    /// Item description inside a material
                    Container
                      (
                      margin: EdgeInsets.only(top: 24.0),
                      child: Material
                        (
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(12.0),
                        shadowColor: Color(0x802196F3),
                        color: Colors.white,
                        child: InkWell
                          (
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyLotsAddPage()));
                          },
                          child: Padding
                            (
                            padding: EdgeInsets.all(24.0),
                            child: Column
                              (
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>
                              [
                                /// Title and rating
                                Column
                                  (
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>
                                  [
                                    Text('Tên', style: TextStyle(color: Colors.black,fontFamily: 'oscinebold',fontSize: 15)),
                                    Row
                                      (
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>
                                      [
                                        Text('Địa chỉ', style: TextStyle(color: Colors.black, fontFamily: 'oscinebold', fontSize: 12)),
                                      ],
                                    ),
                                  ],
                                ),
                                /// Infos

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    /// Item image
                    Align
                      (
                      alignment: Alignment.topRight,
                      child: Padding
                        (
                        padding: EdgeInsets.only(right: 16.0),
                        child: SizedBox.fromSize
                          (
                          size: Size.fromRadius(54.0),
                          child: Material
                            (
                            elevation: 20.0,
                            shadowColor: Color(0x802196F3),
                            shape: CircleBorder(),
                            child: Image.asset('assets/man.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}
