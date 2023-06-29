class todo{
  String? id;
  String? TodoText;
  bool isDone;

   todo({
     required this.id,
     this.isDone=false,
     required this.TodoText
   });
   static List<todo> list(){
     return[
       todo(id: '01',TodoText:'Check mail',isDone:true),
       todo(id: '02',TodoText:'Perform Yoga ',isDone:true),
       todo(id: '03',TodoText:'Pickup grocery',),
       todo(id: '04',TodoText:'Take tommy to the vet',),
       todo(id: '05',TodoText:'Team Meeting',isDone:true),
       todo(id: '06',TodoText:'Take medicines',),

     ];
   }

}