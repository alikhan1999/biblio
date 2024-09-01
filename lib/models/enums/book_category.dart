enum BookCategory {
  classic,
  romance,
  poetry,
  mystery,
  thriller,
  horror,
  fantasy,
  sciFi,
  health,
  history,
  humor,
  comic,
  selfHelp,
  autobiography,
  children,
}

extension BookCategoryExtension on BookCategory {
  String get value {
    switch (this) {
      case BookCategory.classic:
        return 'Classic';
      case BookCategory.romance:
        return 'Romance';
      case BookCategory.poetry:
        return 'Poetry';
      case BookCategory.mystery:
        return 'Mystery';
      case BookCategory.thriller:
        return 'Thriller';
      case BookCategory.horror:
        return 'Horror';
      case BookCategory.fantasy:
        return 'Fantasy';
      case BookCategory.sciFi:
        return 'SciFi';
      case BookCategory.health:
        return 'Health';
      case BookCategory.history:
        return 'History';
      case BookCategory.humor:
        return 'Humor';
      case BookCategory.comic:
        return 'Comic';
      case BookCategory.selfHelp:
        return 'Self help';
      case BookCategory.autobiography:
        return 'Autobiography';
      case BookCategory.children:
        return 'Children';
    }
  }
}
