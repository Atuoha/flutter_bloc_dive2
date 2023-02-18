import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/business_logic/todo/cubits/cubits.dart';

class SearchWeather extends StatelessWidget {
  const SearchWeather({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Weather',
          prefixIcon: const Icon(Icons.search),
          fillColor: Colors.white70,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (String keyword) {
          if (keyword.isNotEmpty) {
            Timer(const Duration(milliseconds: 1000), () {
             // todo implement search
            });
          }
        },
      ),
    );
  }
}
