import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppbar;
  final void Function()? onPressedIconFavor;
  final void Function(String)? onChanged;
  final TextEditingController? textController;
  final void Function()? onPressed;



  const CustomAppBar(
      {super.key, required this.titleAppbar, required this.onPressedIconFavor, required this.onChanged, required this.textController, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 62,
              color: const Color.fromARGB(255, 254, 255, 254),
              child: TextFormField(
                controller: textController,
                onChanged: onChanged,
                decoration: InputDecoration(
                    hintText: titleAppbar,
                    hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 22,
                        color: const Color.fromARGB(255, 201, 201, 201)),
                    prefixIcon:  IconButton(
                      onPressed: onPressed,
                     icon:  const Icon(Icons.search, size: 30,   color: Colors.black,),
                     
                   
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 40.0,
                    ),
                    //    horizontal: 90.0), // تحديد الهامش الداخلي
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor:
                        // const Color.fromARGB(
                        //     255, 211, 222, 255)
                        Appcolors.filltextfromfield),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Appcolors.filltextfromfield,
                borderRadius: BorderRadius.circular(10),
                // color: const Color.fromARGB(255, 211, 222, 255),
              ),
              height: 62,
              child: IconButton(
                onPressed: onPressedIconFavor,
                icon: const Icon(
                  Icons.favorite_outline,
                ),
              )),
        ],
      ),
    );
  }
}
