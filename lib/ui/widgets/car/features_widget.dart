import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mocaz/core/constants/colors.dart';

class FeaturesWidget extends StatefulWidget {
  final List<String> carOptions;

  const FeaturesWidget({Key? key, required this.carOptions}) : super(key: key);

  @override
  State<FeaturesWidget> createState() => _FeaturesWidgetState();
}

class _FeaturesWidgetState extends State<FeaturesWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(_isExpanded ? 0 : 12),
              bottomRight: Radius.circular(_isExpanded ? 0 : 12),
            ),
            color: Color(0xFFEBEBEB),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Équipements & Options",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                icon:
                    _isExpanded
                        ? Icon(CupertinoIcons.chevron_down, size: 20)
                        : Icon(CupertinoIcons.chevron_up, size: 20),
              ),
            ],
          ),
        ),

        Container(
          padding:
              _isExpanded ? const EdgeInsets.symmetric(horizontal: 10) : null,
          width: double.infinity,
          color: Color(0xFFEBEBEB),
          child: AnimatedCrossFade(
            duration: Duration(milliseconds: 300),
            crossFadeState:
                _isExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
            firstChild: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors().white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    widget.carOptions
                        .map(
                          (feature) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              "• $feature",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
            secondChild: SizedBox(),
          ),
        ),

        _isExpanded
            ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEBEBEB),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(_isExpanded ? 12 : 0),
                      bottomRight: Radius.circular(_isExpanded ? 12 : 0),
                    ),
                  ),

                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("AFFICHER PLUS (${widget.carOptions.length})"),
                  ),
                ),
              ],
            )
            : SizedBox(),
        SizedBox(height: 100),
      ],
    );
  }
}
