abstract class SearchMovieEvent {
  const SearchMovieEvent();
}

class SearchMoviesEvent extends SearchMovieEvent {
  final String? query;

  const SearchMoviesEvent({
    this.query,
  });
}
