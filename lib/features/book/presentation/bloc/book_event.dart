abstract class BookEvent {
  const BookEvent();
}

class SearchBookEvent extends BookEvent {
  final String? q;

  const SearchBookEvent({
    this.q,
  });
}
