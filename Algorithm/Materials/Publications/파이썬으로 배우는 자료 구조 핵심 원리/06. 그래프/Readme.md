# 그래프


- 그래프는 정정(vertex)와 에지(edge)의 집합 E(G)로 정의함

  ```G = (V,E)```

<br>

## 그래표 사용 시기

- 로봇이 최단 경로를 계산하여 이동하는 경우
- 네비게이션 상 경로 안내
- 지하철역 건설 장소 선정
- 머신 러닝 

<br>

## 그래프 용어 정리

- 에지
  - 정점과 정점을 이어줌


- 무방향 그래프(undirected graph)
  - (0,1)과 (1,0)은 동일함
  - 정점의 개수가 n인 경우 최대 에지의 개수는 '''n*(n-1)/2``` 


- 방향 그래프
  - ```<0,2>``` 0에서2로 향하는 화살표. 0은 tail, 2는 head 이라고 함 
  - 정점의 개수가 n인 경우 최대 에지의 개수는 ```n*(n-1)```


- 자기 간선 (self-edge)
  - 정점 A가 tail인 동시에 head인 것
  - 화살표가 자기에게서 나가서 자기에게 되돌아오는 것을 떠올리기


- 멀티그래프<br>

  ![image](https://user-images.githubusercontent.com/68424403/188759765-816e4f39-2c56-40e6-86e9-f0538806e3d0.png)
 
  - 멀티그래프는 에지 중복을 허용함 (일반적으로 그래프에서는 에지 중복을 허용하지 않음)


- 인접(adjacent)
  - 정점u와 정점v 사이에 에지(u,v)가 있는 경우, ```u와 v는 서로 인접한다```고 함



- 경로 (path)
  - (v1,v2), (v2,v3),(v3<v4)가 집합 E(G)의 원소일 때 v1에서 v4까지 정점 순서 v1>v2>v3>v4를 의미함
  - 경로의 길이 = 에지의 개수
  - ```단순 경로(simple path)``` 어떤 경로에서 처음과 마지막을 제외하고 모든 정점이 다른 경우
  - ```사이클(cycle)``` 단순 경로에서 처음과 마지막 정점이 같은 것(v2->v3->v4->v2)


- 연결된 그래프(Connected graph)
  - 임의의 정점 u와 어떤 다른 정점 v를 골았을 때 정점 사이에 경로가 있으면 이를 ```연결되었다(connected)```고 함
```
G = (V,E)
V(G) = {0,1,2,3,4,5,6,7}
E(G) = {(0, 3), (0, 4), (1, 2), (1, 5), (2, 5), (3, 4), (4, 6), (5, 7)}
// 정점 집합 {0, 3, 4, 6}과 {1, 2, 5, 7}을 각각 연결 요소(connected component)라고 함
```

- 차수(degree)
  - [무방향 그래프의 경우] 차수 d(v)는 정점 v가 부속된 에지의 개수
  - [방향 그래프의 경우] in-d(v): (정점 v가 haed이며)정점 v로 들어오는 에지의 개수
  - [방향 그래프의 경우] out-d(v): (정점 v가 tail이며)정점 v에서 나가는 에지의 개수
  - [방향 그래프의 경우] 차수 d(v) = in-d(v) + out-d(v)

- 부속되다 (incident)
  - 정점 u와 정점v사이에 에지(u,v)가 존재할 때 ```에지 (u,v)를 정점 u(v)에 부속되었다```고함


- 신장 부분 그래프 (spanning subgraph)
  - 노드가 그래프G와 같고, 에지가 그래프 G의 부분집합인 경우


## 그래프를 표현하는 두 가지 방법

1. 인접 리스트 (adjacency list)
2. 인접 행렬 (adjacency matrix)

### 인접 리스트

- 배열 한 개와 연결 리스트들로 구성
- 정점이 배열의 인덱스가 됨
- O(d(v))

- 예시 (연결 리스트 대신 동적배열로 구현)
```python
'''
- Object
: 정점 집합 V와 정점 집합 V에 속하는 u, v에 대해 (u, v)가 속하는 에지 집합 E로 구성된 튜플 G = (V, E)

1. G.is_empty( ) -> Boolean

: 비어 있으면 TRUE, 아니면 FALSE 반환

2. G.add_vertex( ) -> Integer

: 정점을 추가하고 정점 인덱스를 반환

3. G.delete_vertex(v)

: 정점 v를 삭제

4. G.add_edge(u, v)

: 에지 (u, v)를 추가

5. G.delete_edge(u, v)

: 에지 (u, v)를 삭제

6. G.adj(v) -> array

: 정점 v에 인접한 정점 집합을 동적 배열로 반환

'''

class Graph:
    def __init__(self, vertex_num=None):
        # 인접 리스트
        self.adj_list = []
        self.vtx_num = 0
        # 정점이 있으면 True
        # 정점이 없다면 False
        self.vtx_arr = []
        # 정점 개수를 매개변수로 넘기면
        # 초기화를 진행합니다.
        if vertex_num:
            self.vtx_num = vertex_num    # vtm_num: 정점 개수
            self.vtx_arr = [True for _ in range(self.vtx_num)]    
            # vtx_arr: 정점의 존재 여부 
            # vtx_arr이 필요한 이유: delete_vertex() 메서드로 도중에 있던 정점이 사라질 수 있기 때문)
            # 배열 요소로 연결 리스트 대신 동적 배열을 사용합니다.
            self.adj_list = [[] for _ in range(self.vtx_num)
            
# 정점을 삭제할 때마다 뒤에 있는 모든 정점을 한 칸씩 당긴다면 인접 리스트의 모든 요소를 순회하면서 당겨진 정점을 모두 변경해주어야 하는데, 이는 효율적이지 않음
# 따라서 delete_vertex() 메서드를 호출할 때 단순히 그 정점 인덱스를 비활성화하는 것이 훨씬 편함

    def is_empty(self):
        if self.vtx_num == 0:
            return True
        return False

    def add_vertex(self):   # 추가된 정점의 정점 인덱스를 반환 
        for i in range(len(self.vtx_arr)):  # self.vtx_arr을 순회하면서
            # 중간에 삭제된 정점이 있을 경우(비활성화된 정점이 있는 경우)
            # 이를 재사용합니다.
            # vtx_arr 값이 False면
            # 삭제된 정점이라는 의미입니다.
            if self.vtx_arr[i] == False:
                self.vtx_num += 1
                self.vtx_arr[i] = True
                return i
        # 삭제된 정점이 없다면 정점을 하나 추가합니다.
        self.adj_list.append([])
        self.vtx_num += 1
        self.vtx_arr.append(True)
        return self.vtx_num - 1
        
    def delete_vertex(self, v):
        if v >= self.vtx_num:
            raise Exception(f"There is no vertex of {v}")
        # 매개변수로 전달한 정점 v가 있으면
        if self.vtx_arr[v]:
            # 정점 v의 인접 정점 집합을 초기화합니다. 
            # (인접 리스트의 해당 요소를 빈 리스트로 초기화)
            self.adj_list[v] = []
            self.vtx_num -= 1
            self.vtx_arr[v] = False
            # 나머지 정점 중 v와 인접한 정점이 있다면
            # 그 정점의 리스트에서 v를 제거해 줍니다.
            for adj in self.adj_list:
                for vertex in adj:
                    if vertex == v:
                        adj.remove(vertex)
                        
```



### 인접 행렬

- O(n)





