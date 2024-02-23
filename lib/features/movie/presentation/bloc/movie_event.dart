abstract class MovieEvent {
  const MovieEvent();
}

class SearchMovieEvent extends MovieEvent {
  final String? query;

  const SearchMovieEvent({
    this.query,
  });
}
