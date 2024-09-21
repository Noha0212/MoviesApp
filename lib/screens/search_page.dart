import 'package:flutter/material.dart';
import 'package:os2_project/models/movie.dart';
import 'package:os2_project/service/api.dart';
import 'package:os2_project/service/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  List<Movie> movies = [];
  List<Movie> filteredMovies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      movies = await Api().getTrendingMovies();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching movies: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void searchMovie(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredMovies = [];
      });
    } else {
      final results = movies.where((movie) {
        final movieTitle = movie.originalTitle.toLowerCase();
        final input = query.toLowerCase();
        return movieTitle.contains(input);
      }).toList();

      setState(() {
        filteredMovies = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a Movie',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'ABeeZee',
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: controller,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search_rounded),
                      hintText: 'Movie Name',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onChanged: searchMovie,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredMovies.length,
                    itemBuilder: (context, index) {
                      final movie = filteredMovies[index];
                      return ListTile(
                        leading: Image.network(
                          '${Constant.ImagePath}${movie.posterPath}',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                        title: Text(
                          movie.originalTitle,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
