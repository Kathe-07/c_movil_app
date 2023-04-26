import 'package:c_movil_app/utils/settings.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MyHeaderDrawer.dart';
import 'Profile.dart';
import 'camera.dart';
import 'dashboard.dart';
import 'help.dart';
import 'log_Out.dart';

class NavigationMenu extends StatefulWidget {
  String correo;
  NavigationMenu({super.key, required this.correo});
  @override
  _NavigationMenuApp createState() => _NavigationMenuApp();
}

final preferences = Preferences();


class Preferences {
  Future<void> guardarNombre(String nombre) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('nombre', nombre);

    Future<String?> obtenerNombre() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? nombre = preferences.getString('nombre');
      return nombre;
    }
  }
}

class _NavigationMenuApp extends State<NavigationMenu> {
  var currentPage = DrawerSections.dashboard;
  final TextEditingController usuarioController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),*/
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = const DashboardPage();
    } else if (currentPage == DrawerSections.profile) {
      container = const Profile();
    } else if (currentPage == DrawerSections.settings) {
      container = const SettingsPage();
    } else if (currentPage == DrawerSections.help) {
      container = const Help();
    } else if (currentPage == DrawerSections.log_Out) {
      container = const Log_Out();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        title: const Text("Home"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(correo:widget.correo),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "My Profile", Icons.people_alt_outlined,
              currentPage == DrawerSections.profile ? true : false),
          const Divider(),
          menuItem(3, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          const Divider(),
          menuItem(4, "Help", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.help ? true : false),
          menuItem(5, "Log Out", Icons.feedback_outlined,
              currentPage == DrawerSections.log_Out ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.blueGrey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.profile;
            } else if (id == 3) {
              currentPage = DrawerSections.settings;
            } else if (id == 4) {
              currentPage = DrawerSections.help;
            } else if (id == 5) {
              currentPage = DrawerSections.log_Out;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections { dashboard, profile, settings, help, log_Out }



  /* drawer: Drawer(
        child: ListView
          (//For Image Asse
          padding: EdgeInsets.all(0),
          children:   const [
              UserAccountsDrawerHeader(
                accountName: Text('Hola Tania '),
                accountEmail: Text('tani.rocha7@gmail.com'),
                decoration: BoxDecoration(color: Colors.black),
                currentAccountPicture: CircleAvatar(
                radius: 10.0,
                backgroundColor: Color(0xFF778899),
              ),
            ),
          ],
        ),
      ),*/

      //camara
      /*body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await availableCameras().then(
                  (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraPage(cameras: value,),
                ),
              ),
            );
          },
          child: const Text('Launch Camera'),
        ),
      ),*/





    //);
  //}



//}


