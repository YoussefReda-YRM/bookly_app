import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_fading_widget.dart';
import 'custom_book_image_loading_indicator.dart';

class FeaturedListBooksListViewLoadingIndicator extends StatelessWidget {
  const FeaturedListBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (constext, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImageLoadingIndicator(),
            );
          },
        ),
      ),
    );;
  }
}