// import 'package:bookly_app/core/errors/failures.dart';
// import 'package:bookly_app/core/utils/api_service.dart';
// import 'package:dartz/dartz.dart';
// import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
// import 'home_repo.dart';

// class HomeRepoImpl implements HomeRepo {
//   final ApiService apiService;

//   HomeRepoImpl(this.apiService);
//   @override
//   Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
//     try {
//       var data = await apiService.get(
//           endpoint:
//               'volumes?q=subject:Programming&Filltering=free-ebooks&Sorting=newest');

//       List<BookModel> books = [];
//       for (var item in data['items']) {
//         books.add(BookModel.fromJson(item));
//       }

//       return right(books);
//     } catch (e) {
//       return left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
//     // TODO: implement fetchFeaturedBooks
//     throw UnimplementedError();
//   }
// }

import 'package:bookly_app/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly_app/core/errors/failures.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var booksList = homeLocalDataSource.fetchFeaturedBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var booksList = homeLocalDataSource.fetchNewestBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }
}
