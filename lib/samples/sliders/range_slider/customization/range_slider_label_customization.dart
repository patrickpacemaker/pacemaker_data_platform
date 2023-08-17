///flutter package import
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

///Core theme import
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_core/theme.dart';

///Slider import
import 'package:syncfusion_flutter_sliders/sliders.dart';

///Local imports
import '../../../../model/sample_view.dart';
import '../../slider_utils.dart';

/// Renders Range slider with label customization option
class LabelCustomizationRangleSlider extends SampleView {
  /// Creates Range slider with label customization option
  const LabelCustomizationRangleSlider(Key key) : super(key: key);

  @override
  _LabelCustomizationRangleSliderState createState() =>
      _LabelCustomizationRangleSliderState();
}

class _LabelCustomizationRangleSliderState extends SampleViewState {
  _LabelCustomizationRangleSliderState();
  SfRangeValues _yearValues = SfRangeValues(DateTime(2005), DateTime(2015));
  SfRangeValues _values = const SfRangeValues(-25.0, 25.0);
  late String _selectedType;
  late List<String> _edgeList;
  late EdgeLabelPlacement _edgeLabelPlacement;
  late String _selectedLabelPlacementType;
  late List<String> _labelpositionList;
  late LabelPlacement _labelPlacement;

  @override
  void initState() {
    _selectedLabelPlacementType = 'onTicks';
    _labelpositionList = ['onTicks', 'betweenTicks'];
    _labelPlacement = LabelPlacement.onTicks;
    _selectedType = 'inside';
    _edgeList = <String>['auto', 'inside'].toList();
    _edgeLabelPlacement = EdgeLabelPlacement.inside;
    super.initState();
  }

  SfRangeSliderTheme _yearRangeSlider() {
    return SfRangeSliderTheme(
        data: SfRangeSliderThemeData(
            tooltipBackgroundColor: model.backgroundColor),
        child: SfRangeSlider(
          min: DateTime(2000),
          max: DateTime(2020),
          edgeLabelPlacement: _edgeLabelPlacement,
          labelPlacement: _labelPlacement,
          showLabels: true,
          interval: 5,
          dateFormat: DateFormat.y(),
          dateIntervalType: DateIntervalType.years,
          showTicks: true,
          values: _yearValues,
          onChanged: (SfRangeValues values) {
            setState(() {
              _yearValues = values;
            });
          },
          enableTooltip: true,
          tooltipTextFormatterCallback:
              (dynamic actualLabel, String formattedText) {
            return DateFormat.yMMM().format(actualLabel);
          },
        ));
  }

  SfRangeSliderTheme _numericRangeSlider() {
    return SfRangeSliderTheme(
        data: SfRangeSliderThemeData(
            tooltipBackgroundColor: model.backgroundColor),
        child: SfRangeSlider(
            showLabels: true,
            edgeLabelPlacement: _edgeLabelPlacement,
            labelPlacement: _labelPlacement,
            interval: 25,
            min: -50.0,
            max: 50.0,
            showTicks: true,
            values: _values,
            onChanged: (SfRangeValues values) {
              setState(() {
                _values = values;
              });
            },
            enableTooltip: true));
  }

  Widget _buildWebLayout() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width >= 1000 ? 550 : 440,
        child: _buildMobileLayout(),
      ),
    );
  }

  Widget _buildMobileLayout() {
    final double padding = MediaQuery.of(context).size.width / 20.0;
    return Container(
        padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            title('Numeric'),
            columnSpacing10,
            _numericRangeSlider(),
            columnSpacing40,
            title('DateTime'),
            columnSpacing10,
            _yearRangeSlider(),
            columnSpacing40,
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final Widget rangeSlider =
          model.isWebFullView ? _buildWebLayout() : _buildMobileLayout();
      return constraints.maxHeight > 300
          ? rangeSlider
          : SingleChildScrollView(
              child: SizedBox(height: 300, child: rangeSlider));
    });
  }

  @override
  Widget buildSettings(BuildContext buildContext) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                  model.isWebFullView ? 'Label \nplacement' : 'Label placement',
                  style: TextStyle(
                    color: model.textColor,
                    fontSize: 16,
                  )),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                alignment: Alignment.bottomLeft,
                child: DropdownButton<String>(
                    focusColor: Colors.transparent,
                    underline:
                        Container(color: const Color(0xFFBDBDBD), height: 1),
                    value: _selectedLabelPlacementType,
                    items: _labelpositionList.map((String value) {
                      return DropdownMenuItem<String>(
                          value: (value != null) ? value : 'onTicks',
                          child: Text(value,
                              style: TextStyle(color: model.textColor)));
                    }).toList(),
                    onChanged: (dynamic value) {
                      _onLabelPositionTypeChange(value.toString());
                      stateSetter(() {});
                    }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                  model.isWebFullView
                      ? 'Edge label \nplacement '
                      : 'Edge label placement',
                  style: TextStyle(
                    color: model.textColor,
                    fontSize: 16,
                  )),
              Container(
                width: model.isDesktop ? 140 : 143,
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                alignment: Alignment.bottomLeft,
                child: DropdownButton<String>(
                    isExpanded: true,
                    focusColor: Colors.transparent,
                    underline:
                        Container(color: const Color(0xFFBDBDBD), height: 1),
                    value: _selectedType,
                    items: _edgeList.map((String value) {
                      return DropdownMenuItem<String>(
                          value: (value != null) ? value : 'auto',
                          child: Text(value,
                              style: TextStyle(color: model.textColor)));
                    }).toList(),
                    onChanged: (dynamic value) {
                      _onPositionTypeChange(value.toString());
                      stateSetter(() {});
                    }),
              ),
            ],
          ),
        ],
      );
    });
  }

  void _onLabelPositionTypeChange(String item) {
    _selectedLabelPlacementType = item;
    if (_selectedLabelPlacementType == 'onTicks') {
      _labelPlacement = LabelPlacement.onTicks;
    }
    if (_selectedLabelPlacementType == 'betweenTicks') {
      _labelPlacement = LabelPlacement.betweenTicks;
    }
    setState(() {
      /// update the edge label placement changes
    });
  }

  void _onPositionTypeChange(String item) {
    _selectedType = item;
    if (_selectedType == 'auto') {
      _edgeLabelPlacement = EdgeLabelPlacement.auto;
    }
    if (_selectedType == 'inside') {
      _edgeLabelPlacement = EdgeLabelPlacement.inside;
    }
    setState(() {
      /// update the edge label placement changes
    });
  }
}
