import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/movie_deatials.dart';

Card movieCard(Movie movie, BuildContext context, bool flag) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text(movie.title),
        subtitle: Text('Director: ${movie.director}'),
        leading: CircleAvatar(
          child: (movie.poster.isNotEmpty)
              ? ClipOval(
                  child: Image.network(
                    movie.poster,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: Text(
                          movie.title.isNotEmpty ? movie.title[0] : '?',
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Text(
                        movie.title.isNotEmpty ? movie.title[0] : '?',
                      );
                    },
                  ),
                )
              : Text(movie.title.isNotEmpty ? movie.title[0] : '?'),
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
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: movie.released,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: '\nPlot: ',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: movie.plot,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                if (flag)
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDeatials(movie: movie),
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
}
