import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:os2_project/models/movie.dart';
import 'package:os2_project/screens/search_page.dart';

import 'package:os2_project/service/api.dart';
import 'package:os2_project/weidgets/movies_list_view_weidget.dart';
import 'package:os2_project/weidgets/trend_weidget.dart';

// ignore: camel_case_types
class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_pageState();
}

// ignore: camel_case_types
class _Home_pageState extends State<Home_Page> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRateMovies();
    upcomingMovies = Api().getUpcomigMovies();
  }

//sign out
  // ignore: non_constant_identifier_names
  void SignUserOut() {
    FirebaseAuth.instance.signOut();
  }

  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 2));
  }

  int currentPageIndex = 0;
  final List<Widget> pages = [
    const Home_Page(),
    const SearchPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 8,
          //left: 8,
          //right: 8,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: NavigationBar(
            backgroundColor: const Color.fromARGB(255, 53, 61, 70),
            height: 60,
            onDestinationSelected: (int index) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return pages[index];
                }),
              );
            },
            indicatorColor: const Color(0xffe61e25),
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined, color: Colors.white),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: 'Search',
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: SignUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'assets/flutflix.png',
          fit: BoxFit.fill,
          height: 40,
        ),
        centerTitle: true,
      ),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: const Color(0xFF23272E),
        backgroundColor: const Color(0xffe61e25),
        animSpeedFactor: 3,
        height: 200,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Trending Movies',
                  style: TextStyle(
                    fontFamily: 'ABeeZee',
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // TrendWeidget(),
                SizedBox(
                  child: FutureBuilder(
                    future: trendingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return TrendWeidget(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Top Rated Movies',
                  style: TextStyle(
                    fontFamily: 'ABeeZee',
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  child: FutureBuilder(
                    future: topRatedMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MoviesListView(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                const Text(
                  'Upcoming Movies',
                  style: TextStyle(
                    fontFamily: 'ABeeZee',
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  child: FutureBuilder(
                    future: upcomingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MoviesListView(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
