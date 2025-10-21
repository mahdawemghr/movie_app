import 'package:flutter/material.dart';
import 'package:movie_app/pages/movie_deatials.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
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
  void initState() {
    Provider.of<MovieProvider>(context, listen: false).loadMovies(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieData = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: movieData.movieList.length,
          itemBuilder: (context, index) {
            // return ListTile(
            //   title: Text(movieData.movieList[index].title),
            //   leading: Text(movieData.movieList[index].title[0]),
            //   subtitle: Text("Rating: ${movieData.movieList[index].rated}"),
            //   trailing: ElevatedButton(
            //     onPressed: () {},
            //     child: Icon(Icons.add),
            //   ),
            // );
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  title: Text(movieData.movieList[index].title),
                  subtitle: Text(
                    'Director: ${movieData.movieList[index].director}',
                  ),
                  leading: CircleAvatar(
                    child: Text(movieData.movieList[index].title[0]),
                  ),
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 70),
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: 'Released: ',
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: movieData.movieList[index].released,
                                ),
                                TextSpan(
                                  text: '\nPlot: ',
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: movieData.movieList[index].plot),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDeatials(),
                                ),
                              );
                            },
                            child: Text('Read More'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
