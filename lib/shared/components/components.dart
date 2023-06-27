

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../cubit/cubit.dart';

Widget DefultButton({
  double width = double.infinity,
  Color background = Colors.deepOrange,
  bool isUpperCase = true,
  double radius = 45,
  required  void function(),
  required String text,
})  =>Container(
  width: width,
  height: 60,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius,),
    color: background,

  ),
  child: MaterialButton(

      onPressed:function,
      child: Text(
        isUpperCase ? text.toUpperCase():text ,
        style: TextStyle(
          color: Colors.white,
        )

    ),
  ),
);

Widget defaultTextButton ({
  required void function(),
  required String text,
})=>TextButton(
  onPressed: function,
  child: Text(style: TextStyle(
color: Colors.deepOrange
),
    text.toUpperCase(),
  ),
);

TextFormField defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChanged,
  Function? onTap,
  required String? Function(String? val)? validate,
  required String label,
  required IconData prefix,
  bool isCliskable = true,
  IconData? suffix,
  void suffixPressed()?,
  bool isPassword = false,
}) =>TextFormField(
controller: controller,
keyboardType: type,

style: TextStyle(
fontWeight: FontWeight.bold,
),
validator: validate ,
obscureText: isPassword,
onFieldSubmitted:(s)
  {
    onSubmit!(s);
  },
onChanged: (s)
{
  onChanged!(s);
},
onTap: ()
  {
    onTap! ();
  },
  enabled: isCliskable,
decoration: InputDecoration(
labelText: label,
contentPadding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 6.0),
prefixIcon: Icon(
prefix,
),
suffix: IconButton(
  onPressed: suffixPressed,
  icon: Icon(
  
  suffix,

  ),
),
border: OutlineInputBorder(borderSide:
BorderSide(
width: 5, //<-- SEE HERE

),
borderRadius: BorderRadius.circular(45.0),
),
),

);


Widget myDivider()=>Padding(
  padding: const EdgeInsetsDirectional.only(
      start: 20
  ),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ),
);



void navigateTo (context,widget)=>Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context)=>widget,
    ),
);

void navigateAndFinish(context,widget)=>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context)=>widget),
    ( route) {
      return false;
    },
);

void showToast({
  required String message,
  required ToastStates state
})=>Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor (state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastStates{SUCCESS,ERROR,WARNING}

Color chooseToastColor (ToastStates state)
{
switch(state)
{
  case ToastStates.SUCCESS:
    return Colors.green;
    break;
  case ToastStates.ERROR:
    return Colors.red;
    break;
  case ToastStates.WARNING:
    return Colors.yellow;
    break;
}
}


