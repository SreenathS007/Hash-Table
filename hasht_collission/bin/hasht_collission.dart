import 'package:hasht_collission/hasht_collission.dart' as hasht_collission;

import 'dart:core';


class Entry {
  final String key;
  dynamic value;

  Entry(this.key, this.value);
}

class HashTable {
  late int size;
  late List<List<Entry>> table; 

  HashTable(int size) {
    this.size = size;
    table = List<List<Entry>>.filled(size, []);
  }

  int _hashFunction(String key) {
    int sum = 0;
    for (int i = 0; i < key.length; i++) {
      sum += key.codeUnitAt(i);
    }
    return sum % size;
  }

  void insert(String key, dynamic value) {
    int index = _hashFunction(key);
    table[index].add(Entry(key, value));
  }

  dynamic get(String key) {
    int index = _hashFunction(key);
    List<Entry> bucket = table[index];
    for (Entry entry in bucket) {
      if (entry.key == key) {
        return entry.value;
      }
    }
    return null;
  }

  void remove(String key) {
    int index = _hashFunction(key);
    List<Entry> bucket = table[index];
    for (int i = 0; i < bucket.length; i++) {
      if (bucket[i].key == key) {
        bucket.removeAt(i);
        return;
      }
    }
  }
}

void main() {
  HashTable hashTable = HashTable(10);

  hashTable.insert("New York", 8.6);
  hashTable.insert("London", 9.1);
  hashTable.insert("Tokyo", 13.9);

  print(hashTable.get("New York"));
  print(hashTable.get("London"));
  print(hashTable.get("Tokyo"));

  hashTable.remove("London");

  var londonValue = hashTable.get("London");
  if (londonValue != null) {
    print(londonValue);
  } else {
    print("Key not found in the hash table");
  }
}
