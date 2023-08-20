class Pagination {
  final bool? isEmpty;
  final bool? isNotEmpty;
  final int? currentPage;
  final int? resultsPerPage;
  final int? totalPages;
  final int? totalResults;

  Pagination({
    this.isEmpty,
    this.isNotEmpty,
    this.currentPage,
    this.resultsPerPage,
    this.totalPages,
    this.totalResults,
  });
}

class PaginatedQuery {
  final int? page;
  final int? results;

  PaginatedQuery({
    this.page = 1,
    this.results = 10,
  });

  @override
  String toString() {
    return "Page=$page&Results=$results";
  }

  factory PaginatedQuery.fromJson(Map<String, dynamic> json) => PaginatedQuery(
        page: json["page"],
        results: json["results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results,
      };
}
