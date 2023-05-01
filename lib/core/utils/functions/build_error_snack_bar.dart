import 'package:flutter/material.dart';

import '../../../Features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';

SnackBar buildErrorSnackBar(String errMessage) {
    return SnackBar(
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 3),
          content: Row(
            children: <Widget>[
              const Icon(Icons.error),
              const SizedBox(width: 8.0),
              Text(
                errMessage,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
  }