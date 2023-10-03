import 'package:flutter/material.dart';

Widget defaultButton(
    {
      double width = double.infinity,
      Color background = Colors.blue,
      required  String text,
      required Function function,
      double radius=6.0,
      bool isUpperCase = true,
    }
    
    ) =>Container(
  width:width,
  height: 50.0,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
      radius,
    ),
    color: background,
  ),
  child: MaterialButton(
    onPressed:(){
      function();
    },
    child:Text(
      isUpperCase ? text.toUpperCase() : text,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);
Widget defaultTextButton(
    {
      required Function function,
      required String text,
    }
    )=>TextButton(onPressed:(){
  function();
},
    child:Text(text.toUpperCase())
);
Widget defaultFormField(
    {
      required controller,
      required  type,
      onSubmitt,
      onChange,
      onTap,
      bool isclickable= true,
      bool isPassword=false,
      required validate,
      required label,
      prefix,
      suffix,
      suffixpressed,

    }
    )=>TextFormField(
  keyboardType:type,
  controller: controller,
  onFieldSubmitted: onSubmitt,
  obscureText: isPassword,
  onChanged: onChange,
  validator:validate,
  onTap: onTap,
  enabled: isclickable,
  decoration: InputDecoration(
    labelText:label,
    labelStyle: const TextStyle(color: Colors.green),
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix!=null?IconButton(
        onPressed: suffixpressed ,
        icon: Icon(suffix)):null,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.green)
    ),
    focusedBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.green)
    ), 
  ),
);


