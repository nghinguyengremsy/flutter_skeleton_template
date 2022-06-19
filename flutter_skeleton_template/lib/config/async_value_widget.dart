/*
 * File:       async_value_widget.dart
 * Created on: Sun Jun 19 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Generic AsyncValueWidget to work with values of type T.
///This is used with Stream Provider in Riverpod
class AsyncValueWidget<T> extends StatelessWidget {
  ///Construct
  const AsyncValueWidget({
    Key? key,
    required this.value,
    required this.data,
  }) : super(key: key);

  ///input Async value
  final AsyncValue<T> value;

  ///Output builder function that build the widget when there is data
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      error: (err, _) => Center(
        child: Text(
          err.toString(),
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.red,
              ),
        ),
      ),
    );
  }
}
