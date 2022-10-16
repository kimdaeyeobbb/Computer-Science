n = int(input())   # 문자열의 길이
s = input()   # 문자열
splitset = set()
for idx in range(len(s)):
    splitset.add(s[idx])

print(len(splitset))