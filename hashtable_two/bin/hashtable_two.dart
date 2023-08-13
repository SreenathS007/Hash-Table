import 'package:hashtable_two/hashtable_two.dart' as hashtable_two;


class HashTable{
  List<dynamic> array = [
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

  int findposition(int value){
    int result = value % array.length;
    return result;
      }
      void addToList(int value){
        int index = findposition(value);
        array[index] = value;
      }
      void display(){
        for(var i=0 ;i< array.length;i++){
          print(array[i]);
        }
      }
    }

    void main(List<String>args){
      HashTable hashtable = HashTable();

                hashtable.addToList(11);
                hashtable.addToList(100);
                hashtable.addToList(100);
                hashtable.addToList(412);
                hashtable.addToList(56);
                hashtable.addToList(565);

                hashtable.display();
                
    }