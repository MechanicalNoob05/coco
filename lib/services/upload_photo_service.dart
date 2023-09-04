// ignore_for_file: void_checks

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if(_file != null){
    return await _file;
  }else{
    throw("No Image Selected, fallback to Default");
  }
}

upload(File imageFile) async {
  // open a bytestream
  var stream = http.ByteStream(DelegatingStream(imageFile.openRead()));
  // get file length
  var length = await imageFile.length();

  // string to uri
  var uri = Uri.parse("http://localhost:3000/api/test");

  // create multipart request
  var request = new http.MultipartRequest ("POST", uri);

  // multipart that takes file
  var multipartFile = new http.MultipartFile('profilepic', stream, length, filename: basename(imageFile.path));

  // add file to multipart
  request.files.add(multipartFile);

  // send
  var response = await request.send();
  print(response.statusCode);

  // listen for response
  response.stream.transform(utf8.decoder).listen((value) {
    Map<String, dynamic> result = jsonDecode(value);
    return(result['downloadURL']);
  });
}