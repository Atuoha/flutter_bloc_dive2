import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/business_logic/cubits/todo/cubits.dart';

class SearchTodo extends StatelessWidget {
  const SearchTodo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Todo',
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
            context.read<TodoSearchCubit>().setSearchKeyword(keyword);
          }
        },
      ),
    );
  }
}
