import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWeather extends StatefulWidget {
  SearchWeather({
    Key? key,
    required this.fetchWeather,
  }) : super(key: key);
  Function fetchWeather;

  @override
  State<SearchWeather> createState() => _SearchWeatherState();
}

class _SearchWeatherState extends State<SearchWeather> {
  final formKey = GlobalKey<FormState>();
  TextEditingController searchKeyword = TextEditingController();

  void submitForm() {
    FocusScope.of(context).unfocus();
    final valid = formKey.currentState!.validate();
    if (!valid) {
      return;
    }
    formKey.currentState!.save();
    widget.fetchWeather(context, searchKeyword.text);
  }

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
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Form(
        key: formKey,
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
              onTap: () => submitForm(),
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
            if (value!.isEmpty && value.length < 2) {
              return 'City name needs to be valid!';
            }
            return null;
          },
        ),
      ),
    );
  }
}
