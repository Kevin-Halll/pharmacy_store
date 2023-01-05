import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //<------------ menu information section ------------>
        padding: EdgeInsets.zero,
        children: <Widget>[
          // FutureBuilder<String?>(
          //   future: AuthService().getLocalUser("user"),
          //   builder: (context, snapshot) {
          //     //
          //     if (snapshot.hasData &&
          //         snapshot.data != null &&
          //         snapshot.data != "") {
          //       final user = jsonDecode(snapshot.data!);
          //
          //       return UserAccountsDrawerHeader(
          //         decoration: BoxDecoration(color: AppColor.secondBlue),
          //         accountName: Text(user['fullName'] ?? "Username"),
          //         accountEmail: Text(user['email']),
          //         currentAccountPicture: CircleAvatar(
          //           backgroundColor: Colors.white,
          //           child: Text(
          //             user['fullName']?.split((" "))[0] ?? "Username",
          //             style: const TextStyle(fontSize: 40.0),
          //           ),
          //         ),
          //       );
          //     } else {
          //       return Container();
          //     }
          //   },
          // ),

          //<------------  list tile has each section ------------>
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text('Home'),
            onTap: () {
              // Navigator.pop(context);
            },
          ),

          //<------------  list tile has each section ------------>
          ListTile(
            leading: const Icon(
              Icons.medication,
            ),
            title: const Text('Medication Tracker'),
            onTap: () {
              // Navigator.pop(context);
            },
          ),

          //<------------  list tile has each section ------------>
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text('Settings'),
            onTap: () {
              // Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.power_settings_new,
            ),
            title: const Text('Logout'),
            // onTap: () async {
            //   await AuthService().logout();
            //
            //   // Checks if widget context is mounted
            //   if (!mounted) return;
            //
            //   Navigator.pushNamed(context, '/login');
            // },
          ),
        ],
      ),
    );
  }
}
