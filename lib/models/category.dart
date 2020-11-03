enum Type { Grammar, Vocab }
enum Level { Easy, Normal, Hard }

class Category {
  final Type type;
  final Level rank;

  Category(this.type, this.rank);
}

List<Category> categories = [
  Category(Type.Grammar, Level.Easy),
  Category(Type.Grammar, Level.Normal),
  Category(Type.Grammar, Level.Hard),
  Category(Type.Vocab, Level.Easy),
  Category(Type.Vocab, Level.Normal),
  Category(Type.Vocab, Level.Hard),
];
