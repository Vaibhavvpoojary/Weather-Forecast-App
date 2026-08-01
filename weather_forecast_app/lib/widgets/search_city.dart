import 'package:flutter/material.dart';



class SearchCity extends StatelessWidget {


  final Function(String) onSearch;



  const SearchCity({

    super.key,

    required this.onSearch,

  });



  @override
  Widget build(BuildContext context) {


    final controller = TextEditingController();



    return TextField(


      controller: controller,


      decoration: InputDecoration(

        hintText: "Search Any City",

        prefixIcon:
        const Icon(Icons.search),


        border: OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(20),

        ),

      ),



      onSubmitted:(value){


        if(value.trim().isNotEmpty){


          onSearch(value.trim());


        }


      },

    );


  }


}