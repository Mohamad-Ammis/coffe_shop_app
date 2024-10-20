import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/form_validators.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final int maxline;
  final void Function(String?)? onsaved;
  final void Function(String)? onChanged;
  final InputBorder? inputborder;
  final Widget? sufixicon;
  final Widget? prefixIcon;
  final Color? backgroundcolor;
  final Color? hintcolor;
  final double? hintsize;
  final bool? obscureText;
  //final String? Function(String?)? validator;
  final bool? isname ;
  final bool? isemail ;
  final bool? ispass ;
  final bool? iscoupon ;
  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxline = 1,
      this.onsaved,
      this.onChanged,
      this.inputborder,
      this.sufixicon,
      this.prefixIcon,
      this.backgroundcolor,
      this.hintcolor,
      this.hintsize,
      this.obscureText, this.isname, this.isemail, this.ispass, this.iscoupon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool pv = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: TextFormField(
        obscureText: widget.obscureText != null ? pv : false,
        onChanged: widget.onChanged,
        onSaved: widget.onsaved,
        validator:(data){
          if(widget.isname!= null && widget.isname == true){
            return FormValidators().userNameValidator(data);
          }else if(widget.isemail!= null && widget.isemail == true){
             return FormValidators().emailValidator(data);
          }else if(widget.ispass!= null && widget.ispass == true){
            return FormValidators().strongPasswordValidator(data);
          }else if(widget.iscoupon!= null && widget.iscoupon == true){
            return validat(data);
          }
          else {
            return null ;
          }
        },
        maxLines: widget.maxline,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            filled: true,
            fillColor: widget.backgroundcolor,
            hintText: widget.hint,
            hintStyle: textstyle(),
            border: widget.inputborder ?? buildborder(Colors.black26, 22),
            focusedBorder:
                widget.inputborder ?? buildborder(Colors.black26, 22),
            enabledBorder:
                widget.inputborder ?? buildborder(Colors.black26, 22),
            suffixIcon: widget.obscureText != null
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        pv = !pv;
                      });
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(pv ? Icons.visibility_off : Icons.visibility , color: Colors.black87,),
                    ))
                : widget.sufixicon,
            prefixIcon: widget.prefixIcon != null
                ? SizedBox(
                    width: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 122, 54, 29),
                                borderRadius: BorderRadius.circular(40)),
                          ),
                          widget.prefixIcon!
                        ],
                      ),
                    ),
                  )
                : null),
      ),
    );
  }

  String? validat(value) {
    if (value?.isEmpty ?? true) {
      return "Field is required";
    }
    return null;
  }

  TextStyle textstyle() {
    return TextStyle(
        color: widget.hintcolor ?? const Color.fromARGB(255, 170, 152, 61),
        fontSize: widget.hintsize ?? 21,
        wordSpacing: 2.5,
        letterSpacing: 0.5,
         fontFamily: kFontFamily,
        fontWeight: FontWeight.w700
        );
  }

  OutlineInputBorder buildborder(Color color, double red) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(red),
        borderSide: BorderSide(color: color, width: 0.4));
  }
}
