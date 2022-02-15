with Gnat.Io; use Gnat.Io;
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Vectors;
procedure pp is

package Integer_Vectors is new Ada.Containers.Vectors
	(Index_Type => Natural,
	Element_Type => Integer);

package Nested_Vectors is new Ada.Containers.Vectors
	(Index_Type => Natural,
	Element_Type => Integer_Vectors.Vector,
	"="	=> Integer_Vectors. "=");

use Integer_Vectors;
V : Integer_Vectors.Vector;
NV : Nested_Vectors.Vector;
N: Integer;
function isPrime(N: Integer) return Integer is
i : Integer := 2;
begin 
	if N < 2 then 
		return 0;
	else
		while i < N loop
			if N mod i = 0 then
				return 0;
			end if;
			i := i + 1;
		end loop;
		return 1;
	end if;
end isPrime;

function primes(a: Integer; b: Integer) return Integer_Vectors.Vector is
primes_list : Integer_Vectors.Vector;
begin
	for i in a .. b loop
		if isPrime(i) = 1 then
			primes_list.Append(i);
		end if;
	end loop;
	return primes_list;
end primes;

function primePartitions(n: Integer; k: Integer) return Nested_Vectors.Vector is
primes_list : Integer_Vectors.Vector:=primes(k,n);
temp : Integer_Vectors.Vector;
allPartitions: Nested_Vectors.Vector:= Nested_Vectors.Empty_Vector;
begin
	for i of primes_list loop
		if i = n then
			temp:=Integer_Vectors.Empty_Vector;
			temp.Append(i);
			allPartitions.Append(temp);
		else
			for p of primePartitions(n-i,i+1) loop
				temp := p;
				temp.Prepend(i);
				allPartitions.Append(temp);
			end loop;
		end if;
	end loop;
	return allPartitions;
end primePartitions;

begin 
	Put_Line("Please enter an integer:");
	Get(N);
	
	NV := primePartitions(N,1);
	for E of NV loop
		for i in E.First_Index .. E.Last_Index loop
			if i = E.Last_Index then
				Put(Integer'Image(E(i)));
			else
				Put (Integer'Image(E(i)));
				Put (" + ");
			end if;
		end loop;
		Put_Line("");
	end loop;
end pp;    
