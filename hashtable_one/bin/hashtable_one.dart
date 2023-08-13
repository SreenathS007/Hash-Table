import 'package:hashtable_one/hashtable_one.dart' as hashtable_one;


class HashTable{
  List<dynamic> array =[
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
         ];
    int findposition(String name){
      int sum = 0;
      for(var i =0; i < name.length;i++){
        int asci =name.codeUnits[i];
        sum = sum + asci;
      }
      int result =sum % array.length;
      return result;
    }
    void addToList(String name){
      int index = findposition(name);
      array[index] = name;
    }
    void display(){
      for( var i = 0; i< array.length;i++){
        print(array[i]);
      }
    }
}
void main(){
  HashTable hashtable = HashTable();
            hashtable.addToList('sreenath');
            hashtable.addToList('sanandh');
            hashtable.addToList('deepak');
            hashtable.addToList('jithin das');
            hashtable.addToList('rohith');
            hashtable.addToList('nishandh');
            hashtable.addToList('farshad');

            hashtable.display();
}
