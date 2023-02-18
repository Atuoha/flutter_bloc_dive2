import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/business_logic/todo/cubits/cubits.dart';

class SearchWeather extends StatefulWidget {
  const SearchWeather({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchWeather> createState() => _SearchWeatherState();
}

class _SearchWeatherState extends State<SearchWeather> {
  TextEditingController searchKeyword = TextEditingController();

  @override
  void initState() {
    searchKeyword.addListener(() {
      setState(() {
        searchKeyword;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 5
      ),
      child: TextFormField(
        controller: searchKeyword,
        decoration: InputDecoration(
          hintText: 'Search Weather',
          prefixIcon: searchKeyword.text.isNotEmpty
              ? GestureDetector(
                  onTap: () => setState(() {
                    searchKeyword.clear();
                  }),
                  child: const Icon(
                    Icons.cancel_outlined,
                  ),
                )
              : const SizedBox.shrink(),
          suffixIcon: GestureDetector(
            onTap: () {
              print('sdfsdf');
            },
            child: const Icon(Icons.search),
          ),
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Can not be empty!';
          }
          return null;
        },
      ),
    );
  }
}
