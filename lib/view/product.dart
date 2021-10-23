import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mart/controller/product_controller.dart';
import 'package:mart/extensions.dart';
import 'package:mart/model/product_model.dart';
import 'package:intl/intl.dart';


class Product extends StatefulWidget {
   Product({Key? key,this.data}) : super(key: key);

   final data ;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final formKey = GlobalKey<FormState>();
  final productController = Get.put(ProductController());

   final nameController = TextEditingController();

   final dateController = TextEditingController();

   final ratingController = TextEditingController();


   final descriptionController = TextEditingController();

   DateTime currentDate = DateTime.now();
  static final TextInputFormatter digitsOnly = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));

  void initState() {
    super.initState();
    setState(() {
      nameController.text = widget.data== true ?"":widget.data.name;
      dateController.text =  widget.data== true ?"":widget.data.date;
      ratingController.text =  widget.data== true ?"":widget.data.rating.toString();
      descriptionController.text = widget.data== true ?"": widget.data.description;
    });
  }



   Future<void> _selectDate(BuildContext context) async {
     final DateTime? pickedDate = await showDatePicker(
         context: context,
         initialDate: currentDate,
         firstDate: DateTime(2015),
         lastDate: DateTime(2050));
     if (pickedDate != null && pickedDate != currentDate)
       setState(() {
         currentDate = pickedDate;
       });
   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Page"),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(minWidth: 100, maxWidth: 500),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  widget.data== true
                  ?"ADD NEW PRODUCT":"EDIT PRODUCT DETAILS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.amber
                  ),
              ),
              SizedBox(height: 20,),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Text("Product :-",style: TextStyle(color: Colors.amber),),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),color:Color(0xFFEFF3F6),),

                      child: TextFormField(
                        controller: nameController,
                        enabled: widget.data== true ?true:false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Product Name"

                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ).addNeumorphism(
                      borderRadius : 3.0,
                      offset : const Offset(6, 2),
                      blurRadius : 6.0,
                      topShadowColor : Color.fromRGBO(255, 255, 255, 0.9),
                      bottomShadowColor : Color.fromRGBO(255, 255, 255, 0.9),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: Text('Select date'),
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Text(

                            DateFormat('yyyy-MM-dd').format(currentDate).toString()
                        ),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Text("Rating :-",style: TextStyle(color: Colors.amber),),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),color:Color(0xFFEFF3F6),),
                      child: TextFormField(
                        controller: ratingController,
                          keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Product Rating"

                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty || int.parse(value)>5 || int.parse(value)<1) {
                            return 'Please enter product rating (1-5)';
                          }
                          return null;
                        },
                      ),
                    ).addNeumorphism(
                      borderRadius : 3.0,
                      offset : const Offset(6, 2),
                      blurRadius : 6.0,
                      topShadowColor : Color.fromRGBO(255, 255, 255, 0.9),
                      bottomShadowColor : Color.fromRGBO(255, 255, 255, 0.9),
                    ),
                    SizedBox(height: 20,),
                    Text("Description :-",style: TextStyle(color: Colors.amber),),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),color:Color(0xFFEFF3F6),),

                      child: TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Product Description"

                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter product description';
                          }
                          return null;
                        },
                      ),
                    ).addNeumorphism(
                      borderRadius : 3.0,
                      offset : const Offset(6, 2),
                      blurRadius : 6.0,
                      topShadowColor : Color.fromRGBO(255, 255, 255, 0.9),
                      bottomShadowColor : Color.fromRGBO(255, 255, 255, 0.9),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),color:Color(0xFFEFF3F6),),

                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (formKey.currentState!.validate()) {
                            ProductModel product = new ProductModel(
                              name: nameController.text,
                              rating: int.parse(ratingController.text),
                              description: descriptionController.text,
                              date: dateController.text,

                            );

                            if(widget.data==true){
                              bool flag = productController.addProduct(product);
                              if(flag){
                                Navigator.of(context).pop();
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Product Name already exists')),
                                );
                              }
                            }else{
                              productController.editProduct(product);
                              Navigator.of(context).pop();
                            }


                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ).addNeumorphism(
                      borderRadius : 3.0,
                      offset : const Offset(6, 2),
                      blurRadius : 6.0,
                      topShadowColor : Color.fromRGBO(255, 255, 255, 0.9),
                      bottomShadowColor : Color.fromRGBO(255, 255, 255, 0.9),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
