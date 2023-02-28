import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:pmsna1/provider/theme_provider.dart';
import 'package:pmsna1/settings/styles_settings.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {


    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Social TEC'),
      ),
      drawer: Drawer(
        child: ListView(
          children:  [
            const UserAccountsDrawerHeader(
               currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://cdn.dribbble.com/users/1057075/screenshots/3432494/lynx_1x.jpg'),
              ),
              accountName: Text('Fernando Daniel'), 
              accountEmail: Text('FernandoHdez@gmail.com')
              ),
              ListTile(
                onTap: () {},
                title: Text('Práctica 1'),
                subtitle: Text('Descripción de la práctica'),
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.chevron_right),
              ),
              DayNightSwitcher(
                isDarkModeEnabled: isDarkModeEnabled, 
                onStateChanged: (isDarkModeEnabled){
                  isDarkModeEnabled
                  ? theme.setthemeData(StylesSettings.darkTheme())
                  : theme.setthemeData(StylesSettings.lightTheme());
                  this.isDarkModeEnabled = isDarkModeEnabled;
                  setState(() {});
                },
                
                )
          ],
        ),
      ),
    );
    
  }
}
