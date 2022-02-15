import math

def isPrime(N):
    if N <= 1:
        return False
    for i in range(2, int(math.sqrt(N)+1)):
        if N % i == 0:
            return False
    return True

def primes(a, b):
    primes = []
    for i in range(a, b+1):
        if(isPrime(i)):
            primes.append(i)
    return primes

def prime_partitions(n, k):
    primes_list = primes(k,n)
    partitions = [[]]
    for i in primes_list:
        if i == n:
            temp = []
            temp.append(i)
            partitions.append(temp)
        else:
            for p in prime_partitions(n-i,i+1):
                temp = p
                temp.insert(0,i)
                partitions.append(temp) 
    return partitions


value = input("Enter your value: ")
temp = int(value)

total = prime_partitions(temp,1)

finalPartitions = [[]]
for i in range(0,len(total)):
    sum = 0
    for j in range(0,len(total[i])):
        sum += total[i][j]
    if sum == temp:
        finalPartitions.append(total[i])
finalPartitions.pop(0)
for i in range(0,len(finalPartitions)):
    for j in range(0, len(finalPartitions[i])):
        if j == len(finalPartitions[i])-1:
            print(finalPartitions[i][j])
        else:
            print(finalPartitions[i][j], " + ", end='')
