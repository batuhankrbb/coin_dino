import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class HtmlParser {
static final shared = HtmlParser._privateConstructor();

  HtmlParser._privateConstructor();

  String parseHtmlToString(String htmlText) {
    var document = parse(htmlText);
    var parsedText = document.body?.text;
    return parsedText ?? "";
  }
}
