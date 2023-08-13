import 'package:hashcollision_two/hashcollision_two.dart' as hashcollision_two;

class Entry{
  final String key;
  dynamic value;

  Entry(this.key,this.value);
}
class HashTable{
  late int size;
  late List<List<Entry>>table;

  HashTable(this.size){
  table = List<List<Entry>>.filled(size,[]);

}

int _hashFunction(String key){

  int sum = key.codeUnits.fold(0, (prev, curr) => prev + curr);
  return sum % size; 
}
void insert(String key,dynamic value){
  int index = _hashFunction(key);
  table[index].add(Entry(key,value));
}
dynamic get(String key){
  int index = _hashFunction(key);
for(Entry entry in table[index]){
  if(entry.key == key){
    return entry.value;
  }
}
return null;
}

void remove(String key){
  int index =_hashFunction(key);
  table[index].removeWhere((entry) => entry.key == key);
  
  }
}
void main(){
  HashTable hashtable = HashTable(50);

      hashtable.insert('new ork',8.6);
      hashtable.insert("London",9.1);  
      hashtable.insert("Tokyo",13.9);

      print(hashtable.get("new york"));
       print(hashtable.get("London"));
        print(hashtable.get("Tokyo"));
        
        hashtable.remove("London");
        var londonvalue =hashtable.get("London");
        print(londonvalue??"key not found");
}