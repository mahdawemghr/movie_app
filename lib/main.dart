import 'package:flutter/material.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<MovieProvider>(context).loadMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
        backgroundColor: Color(Colors.grey.value),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(movies[index]),
              leading: Text(movies[index][0]),
              subtitle: Text("data"),
              trailing: Icon(Icons.add),
            );
            // return Card(child: Center(child: Text(movies[index])));
          },
        ),
      ),
    );
  }
}
