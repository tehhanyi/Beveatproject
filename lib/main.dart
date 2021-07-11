import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

//import 'package:onemapsg/onemapsg.dart';
//const String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjc3NTEsInVzZXJfaWQiOjc3NTEsImVtYWlsIjoiaHZueWl0ZWhAZ21haWwuY29tIiwiZm9yZXZlciI6ZmFsc2UsImlzcyI6Imh0dHA6XC9cL29tMi5kZmUub25lbWFwLnNnXC9hcGlcL3YyXC91c2VyXC9zZXNzaW9uIiwiaWF0IjoxNjI1ODUwMzgzLCJleHAiOjE2MjYyODIzODMsIm5iZiI6MTYyNTg1MDM4MywianRpIjoiM2MxNzQxODViN2UzY2Q4NDg4MzQ5MDg0NDRiMzljMTQifQ.2Kp8XgTvSEThcguKtxp608Iqh7N7z_4LW3PyroBz50Q";
void main() {/*
  OneMap oneMap;
  OneMap.initialize(accessToken: token);
  // Get singleton instance.
  oneMap = OneMap.instance;
  // Authenticate and retrieve token
  if (oneMap.authentication.accessToken.isEmpty) {
    try {
      OneMapCredentials credentials =
      await oneMap.authentication.getToken(email: 'hvnyiteh@gmail.com', password: 'T@!30561h');
      // Cache accessToken if needed here, expiry timestamp is included.
      print(credentials.accessToken);
      print(credentials.expiry);
    } catch (e) {
      print(e);
    }
  }*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BevEat',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Color(0xFFBD2744),
            centerTitle: true,
            elevation: 2,
            title: Text("Location", style: TextStyle(fontSize: 25.0,),textAlign: TextAlign.center),
            leading: IconButton(icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context)),
            actions: <Widget>[
              FlatButton(
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Empty()),
                  );
                },
                child: Text("Filter", style: TextStyle(fontSize: 20.0),),
                shape: CircleBorder(
                    side: BorderSide(color: Colors.transparent)),
              ),
            ],
          ),
        ),

        body: SlidingUpPanel(
          backdropEnabled: true,
          panelSnapping: true,
          defaultPanelState: PanelState.CLOSED,
          panelBuilder: (ScrollController sc) => list(context),
          collapsed: Container(
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: radius
              )),

          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/map.PNG"),
                fit: BoxFit.cover,
              ),
            ),
            child: null /* add child content here */,
          ),
          borderRadius: radius,
        )
    );
  }

  Widget list(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Divider(height: 3),
        ListTile(
          title: Text("Map Details", style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w900),),
        ),
        ListTile(
            title: Text("Food Donation", style: TextStyle(fontSize: 20.0,color: Colors.green,fontWeight: FontWeight.bold)),
            subtitle: Text("Food Category\nPosted On: 2020-10-10 10:00"),
            isThreeLine: true,
            leading: CircleAvatar(backgroundImage: AssetImage("assets/beveat.jpg") /*NetworkImage(
                "https://is2-ssl.mzstatic.com/image/thumb/Purple123/v4/f3/d0/8d/f3d08d05-014b-0691-d800-d17899f43e01/source/512x512bb.jpg")*/
            ),
            trailing: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 100, minHeight: 80),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLBiX1xVz-pfiGkVxLgO65_ga-EJ6z0NUaA7Ca_BX8wQH3aknhBalr-VFmLdZmlFm1IQ&usqp=CAU',
                  width: 100,
                  height: 80,
                )
            ),
        ),
        Divider(thickness: 3,),
        ListTile(
            title: Text("Event Food Donation",style: TextStyle(fontSize: 20.0,color: Colors.blue,fontWeight: FontWeight.bold)),
            subtitle: Text("Food Category x 20\nPosted On: 2020-10-10 10:00"),
            isThreeLine: true,
            leading: CircleAvatar(backgroundImage: AssetImage("assets/beveat.jpg")),
            trailing: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 100, minHeight: 100),
                child: Image.network(
                  'https://w7.pngwing.com/pngs/120/161/png-transparent-white-and-green-check-logo-check-mark-emoji-computer-icons-emoticon-tick-angle-text-rectangle-thumbnail.png',
                  width: 100,
                  height: 80,
                )
            ),
        ),
        Divider(thickness: 3,),
        ListTile(
            title: Text("Benie Request",style: TextStyle(fontSize: 20.0,color: Colors.orange,fontWeight: FontWeight.bold)),
            subtitle: Text("Food Category\nPosted On: 2020-10-10 10:00"),
                isThreeLine: true,
            leading: CircleAvatar(backgroundImage: AssetImage("assets/beveat.jpg")),
        ),
        Divider(thickness: 3,),
        Divider(thickness:2,color: Color(0xFFBD2744),),
        Column(
          children: [
            Container(
                child: Center(
                    child: Text("Can't find what you are looking for?", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 20, color: Colors.black87,))
                )
            ),
            Container(
                child: Center(
                    child: Text("Try below options instead.", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 20, color: Colors.black87,))
                )
            ),
            ButtonTheme(
              minWidth: 300,
              height: 40.0,
              child:FlatButton(
              textColor: Colors.white,
              color: Color(0xFFBD2744),
                child: Text("Refine Filters"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Empty()),
                );
              },
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),),
              )
            ),
            Container(
                child: Center(
                    child: Text("Or", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 20, color: Colors.black87,))
                )
            ),
            Container(
                child: Center(
                    child: Text("Create Benie Broadcast", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 20, color: Color(0xFFBD2744),fontWeight: FontWeight.bold)))
            ),
          ],
        ),
      ],
    );
  }
}

class Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Empty Activity"),
        backgroundColor: Color(0xFFBD2744),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFBD2744),
          ),
          child: Text('Go back!'),
        ),
      ),
    );
  }
}