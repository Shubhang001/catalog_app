import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Shubhang Shukla"),
                 accountEmail: Text("shubhangshukla001@gmail.com"),
                 currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://imgs.search.brave.com/I6AgMs5h5YV2A4iIWstKfaAa2nHaXn_I3Fj4LkjyNBk/rs:fit:1000:892:1/g:ce/aHR0cHM6Ly9jZG4z/LnZlY3RvcnN0b2Nr/LmNvbS9pLzEwMDB4/MTAwMC80OS8yNy9s/ZXR0ZXItc3MtbG9n/by1pY29uLWRlc2ln/bi10ZW1wbGF0ZS1l/bGVtZW50cy12ZWN0/b3ItMjE5MjQ5Mjcu/anBn',
                    scale: 2.0),
                 ),
                 ),
                 ),
                 const ListTile(
                  leading:  Icon(
                    CupertinoIcons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Home",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                 ),
                 const ListTile(
                  leading:  Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Profile",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                 ),
                 const ListTile(
                  leading:  Icon(
                    CupertinoIcons.mail,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Email Us",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                 ),
              ],
        ),
      ),
    );
  }
}