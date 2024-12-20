import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safar/widgets/destination_carousel.dart';
import 'package:safar/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  // Icons for the top menu
  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.person,
    FontAwesomeIcons.bicycle,
  ];

  // Pages for BottomNavigationBar
  final List<Widget> _pages = [
    HomePage(),
    ThoughtsPage(),
    ProfilePage(),
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).colorScheme.secondary
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentTab], // Dynamic page based on current tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment,
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text(
              'What would you like to find?',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          DestinationCarousel(),
          SizedBox(height: 20.0),
          HotelCarousel(),
        ],
      ),
    );
  }
}

// Pizza Page
class ThoughtsPage extends StatefulWidget {
  @override
  _ThoughtsPageState createState() => _ThoughtsPageState();
}

class _ThoughtsPageState extends State<ThoughtsPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _thoughts = [];

  void _addThought() {
    final thought = _controller.text.trim();
    if (thought.isNotEmpty) {
      setState(() {
        _thoughts.add(thought); // Update the list of thoughts
        _controller.clear(); // Clear the text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thoughts Page')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Share your thought',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addThought,
            child: Text('Post Thought'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _thoughts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_thoughts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Profile Page
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Color(0xFFE7EBEE),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_rounded)),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? Icons.sunny : Icons.mode_night_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      color: Colors.white,
                      child: Icon(
                        Icons
                            .perm_identity, //use the image here instead of icon
                        size: 70,
                      ),
                    ),
                  )),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Abhay',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'abhay.23bai10313@vitbhopal.ac.in',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(height: 20),

              //Menu
              ProfilemenuWidget(
                title: "Favourites",
                icon: Icons.favorite_border,
                onPress: () {},
                endIcon: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ProfilemenuWidget(
                title: "My Posts",
                icon: Icons.analytics_outlined,
                onPress: () {},
                endIcon: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ProfilemenuWidget(
                title: "Saved Posts",
                icon: Icons.save_alt,
                onPress: () {},
                endIcon: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ProfilemenuWidget(
                title: "Settings",
                icon: Icons.settings,
                onPress: () {},
                endIcon: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ProfilemenuWidget(
                title: "About us",
                icon: Icons.info,
                onPress: () {},
                endIcon: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilemenuWidget extends StatelessWidget {
  const ProfilemenuWidget({
    required this.title,
    required this.icon,
    required this.onPress,
    required this.endIcon,
    super.key,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(0xFFECB87A).withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      trailing: endIcon
          ? Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black.withOpacity(0.1),
              ),
              child: Icon(
                Icons.chevron_right_sharp,
                color: Colors.black,
              ),
            )
          : null,
    );
  }
}
