import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/book_entity.dart';

class FetchFeaturedBooksUseCase extends UseCAse<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}