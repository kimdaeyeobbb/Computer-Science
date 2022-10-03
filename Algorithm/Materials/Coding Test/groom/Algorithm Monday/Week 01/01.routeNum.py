n = int(input())
nums = list(map(int,input().split()))
result = 1
for num in nums:
    result *= num

print(result)