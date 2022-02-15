let rec divisible n k =
        ((k > 1) && ((n mod k == 0) || divisible n (k-1))) || (n < 2);;

let isP n = 
        divisible n (n-1);;



let rec primes a b = 
        if a > b then [] else
                let tail = primes (a+1) b in
                if not (isP a) then a :: tail else tail;;

let rec primePartition n k =
        List.flatten (List.map (fun i -> if i == n then [[i]] else 
                (List.map (fun y -> i::y) 
        (primePartition (n-i) (i+1)))) (primes k n));;
                

let print_list ls =
        print_string(String.concat " + " (List.map string_of_int ls));
        print_string "\n";;


let () = print_string "type a number: ";;
let i = read_int();;


let xd = primePartition i 1 ;;

List.iter (print_list) xd;;
