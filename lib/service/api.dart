import 'package:os2_project/models/movie.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=92e0118fc5ff8c722a292859cdd994c6';
  static const _topRateUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=92e0118fc5ff8c722a292859cdd994c6';
  static const _upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=92e0118fc5ff8c722a292859cdd994c6';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;

      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happened!');
    }
  }

  Future<List<Movie>> getTopRateMovies() async {
    final response = await http.get(Uri.parse(_topRateUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;

      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happened!');
    }
  }

  Future<List<Movie>> getUpcomigMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;

      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happened!');
    }
  }
}
