import 'package:abwab_learning_path/learning_path/exports.dart';
import 'package:flutter/material.dart';

class PathCardWidget extends StatefulWidget {
  final LearningPathModel model;
  final int index;

  const PathCardWidget({Key? key, required this.index, required this.model})
      : super(key: key);

  @override
  _PathCardWidgetState createState() => _PathCardWidgetState();
}

class _PathCardWidgetState extends State<PathCardWidget> {
  bool _isTaskFinished = true;

  @override
  Widget build(BuildContext context) {
    return widget.index.isOdd
        ? CustomPaint(
            painter: CurvePainter(false, _isTaskFinished),
            child: _learningCardWidget(),
          )
        : widget.index == 0
            ? _learningCardWidget()
            : CustomPaint(
                painter: CurvePainter(true, _isTaskFinished),
                child: _learningCardWidget(),
              );
  }

  /// Learning card widget
  Widget _learningCardWidget() {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          elevation: 3,
          shadowColor: Colors.grey.withOpacity(0.2),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: _isTaskFinished ? Colors.orange : Colors.grey,
                height: 4,
              ),

              // Name of Course
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    widget.model.name!,
                    style: TextStyle(
                        color: _isTaskFinished ? Colors.orange : Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Check Icon Widget
        Positioned(
          top: 1,
          bottom: 0,
          left: 20,
          child: Container(
            width: 25,
            decoration: BoxDecoration(
              color: _isTaskFinished ? Colors.orange : Colors.grey,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 15,
                ),
              ],
            ),
            child: Icon(
              _isTaskFinished
                  ? Icons.check_rounded
                  : Icons.priority_high_rounded,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
