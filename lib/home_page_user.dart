import 'package:ensanim/user_liked_animal_page.dart';
import 'package:ensanim/user_profile_page.dart';
import 'package:ensanim/user_read_animal_page.dart';
import 'package:flutter/material.dart';

class HomePageUser extends StatefulWidget {
  @override
  _HomePageUserState createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomePageUser> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ReadAnimalUser(),
    LikedAnimalsPage(),
    UserProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('User Home Page'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget buildBottomNavigationBar() {
    // Media Query ukuran berdasarkan layar
    var lebar = MediaQuery.of(context).size.width;

    // Penyesuaian atau konfigurasi lebar dari layar
    int itemsCount = lebar > 600 ? 3 : 2;

    return BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Liked',
        ),
        if (lebar > 600) // tampilan halaman profil
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
      ]
          .take(itemsCount)
          .toList(), // Mengambil hanya sejumlah item yang diperlukan
    );
  }
}

// kodingan ubed
// import 'package:ensanim/user_liked_animal_page.dart';
// import 'package:ensanim/user_profile_page.dart';
// import 'package:ensanim/user_read_animal_page.dart';
// import 'package:flutter/material.dart';

// class HomePageUser extends StatefulWidget {
//   @override
//   _HomePageUserState createState() => _HomePageUserState();
// }

// class _HomePageUserState extends State<HomePageUser> {
//   int _currentIndex = 0;
//   final List<Widget> _children = [
//     // Widget Home(),
//     // Widget Liked(),
//     ReadAnimalUser(),
//     LikedAnimalsPage(),
//     UserProfilePage(), // Profile Page
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Home Page'),
//       ),
//       body: _children[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: onTabTapped,
//         currentIndex: _currentIndex,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Liked',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }

//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }
