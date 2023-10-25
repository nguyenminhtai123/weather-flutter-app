import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final _textController = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(16.0),
        child: TextField(
          style: const TextStyle(color: Colors.black),
          controller: _textController,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: "Search Location",
            suffixIcon: _textController.text.isEmpty
                ? null
                : InkWell(
                    radius: 4.0,
                    onTap: () {
                      setState(
                        () {
                          _textController.clear();
                        },
                      );
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.blue,
                    ),
                  ),
            hintStyle: const TextStyle(color: Colors.grey),
            errorText: _validate ? null : null,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            icon: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.search,
                color: Colors.blue,
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: _textController.text.isEmpty ? 12.0 : 14.0,
              bottom: _textController.text.isEmpty ? 12.0 : 0.0,
            ),
          ),
        ),
      ),
    );
  }
}
