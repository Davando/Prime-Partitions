import java.util.*;

public class PrimePartitions {

    public boolean isPrime(int n) {
        return !divisible(n, n-1);
    }

    public boolean divisible(int n, int k) {
        return ((k > 1) && ((n % k == 0) || divisible(n, k - 1))) || (n < 2);
    }

    public ArrayList<Integer> primes(int a, int b) {
        ArrayList<Integer> primes = new ArrayList<>();
        for(int i = a; i <= b; i++) {
            if(isPrime(i)) {
                primes.add(i);
            }
        }
        return primes;
    }

    //generates all prime partitions of n using primes greater than k
    public ArrayList<ArrayList<Integer>> prime_partitions(int n, int k) {

        ArrayList<Integer> primes_list = new ArrayList<>(primes(k,n));
        ArrayList<ArrayList<Integer>> partitions = new ArrayList<ArrayList<Integer>>();
        for(int i: primes_list) {
            if(i == n) {
                ArrayList<Integer> temp = new ArrayList<Integer>();
                temp.add(i);
                partitions.add(temp);
            }
            else {
                for(ArrayList<Integer> p : prime_partitions(n - i,  i + 1)) {
                    ArrayList<Integer> temp = new ArrayList<Integer>(p);
                    temp.add(0, i);
                    partitions.add(temp);
                }
            }
        }

        return partitions;

    }

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.println("Please enter an integer (preferably under 100):");
        int input = sc.nextInt();
        PrimePartitions pp = new PrimePartitions();
        ArrayList<ArrayList<Integer>> prime_parts = pp.prime_partitions(input, 1);

        System.out.println("The set of all prime numbers for " + input + " is:");

        for(ArrayList<Integer> list : prime_parts) {
            for(int i = 0; i < list.size(); i++) {
                System.out.print(list.get(i));
                if(i != list.size() - 1) {
                    System.out.print(" + ");
                }
            }
            System.out.println();
        }

    }
}
