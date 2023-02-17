import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../business_logic/todo/bloc/todosearch/todosearch_bloc.dart';

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
            Timer(const Duration(milliseconds: 1000), () {
              context
                  .read<TodoSearchBloc>()
                  .add(SetSearchKeyword(keyword: keyword));
            });
          }
        },
      ),
    );
  }
}
