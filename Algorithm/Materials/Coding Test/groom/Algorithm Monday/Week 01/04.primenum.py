'''
1. 2 ~ N까지의 범위가 담긴 배열을 만든다.
2. 해당 배열 내의 가장 작은 수 i 부터 시작하여, i의 배수들을 해당 배열에서 지워준다. (i는 소수이기 때문에 i자체는 지우지 않는다.)
3. 주어진 범위 내에서 i의 배수가 모두 지워지면 i 다음으로 작은 수의 배수를 같은 방식으로 배열에서 지워준다.
4. 더 이상 반복할 수 없을 때까지 2, 3번의 과정을 반복해준다.
'''
def is_prime_num(n):
    sumOfPrime = 0
    arr = [True] * (n + 1) # 특정 수가 지워졌는지 아닌지 확인하기 위한 배열
    arr[0] = False
    arr[1] = False

    for i in range(2, n + 1):
        if arr[i] == True: # 특정 수가 지워지지 않았다면 (소수여서)
            j = 2

            while (i * j) <= n:
                arr[i*j] = False # i의 배수의 값을 False로 지워준다.
                j += 1

    return arr[abs(n)]

numlen = int(input())
numlist = list(map(int,input().split()))

result = 0

for i in range(len(numlist)):
    if is_prime_num(i+1) == True:
        result += numlist[i]

print(result)