using System;
using System.Collections.Generic;

class PrimePartitions {

  public bool isPrime(int n) {
      return !divisible(n, n-1);
  }

  public bool divisible(int n, int k) {
      return ((k > 1) && ((n % k == 0) || divisible(n, k - 1))) || (n < 2);
  }

  public List<int> primes(int a, int b) {
    List<int> primes = new List<int>();
    for(int i = a; i <= b; i++) {
      if(isPrime(i)) {
        primes.Add(i);
      }
    }
    return primes;
  }

  public List<List<int>> prime_partitions(int n, int k) {

      List<int> primes_list = new List<int>(primes(k,n));
      List<List<int>> partitions = new List<List<int>>();
      foreach(int i in primes_list) {
          if(i == n) {
              List<int> temp = new List<int>();
              temp.Add(i);
              partitions.Add(temp);
          }
          else {
              foreach(List<int> p in prime_partitions(n - i,  i + 1)) {
                  List<int> temp = new List<int>(p);
                  temp.Insert(0, i);
                  partitions.Add(temp);
              }
          }
      }
      return partitions;
  }

  public static void Main(String[] args) {

      Console.WriteLine("Please enter an integer (preferably under 100):");
      int input = Convert.ToInt32(Console.ReadLine());
      PrimePartitions pp = new PrimePartitions();
      List<List<int>> prime_parts = pp.prime_partitions(input, 1);

      Console.WriteLine("The set of all prime numbers less than " + input + " is: ");

      foreach(List<int> list in prime_parts) {
          for(int i = 0; i < list.Count; i++) {
              Console.Write(list[i]);
              if(i != list.Count - 1) {
                  Console.Write(" + ");
              }
          }
          Console.WriteLine();
      }

  }
}
