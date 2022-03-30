/* 근사값 알고리즘 */
// 근사값 찾는 원리: 기준값과의 차이의 절대값 중 최소값이 되는 것을 찾자

(function () {
  let numberList = [1, 10, 16, 20, 8, 6, 17, 11];
  const target = 18, // 기준값
    N = numberList.length;
  let nearNum = 0; // 근사값 (기준값과의 차이의 절대값이 최소)
  let min = Number.MAX_SAFE_INTEGER; // 타겟과 근사값의 차이

  for (let i = 0; i < N; i++) {
    let gap = Math.abs(numberList[i] - target); // 차잇값의 절대값
    if (gap < min) {
      min = gap; // min: 최솟값 알고리즘
      nearNum = numberList[i];
    }
  }

  console.log(
    "주어진 숫자들 중 " +
      target +
      "와 가장 가까운 값: " +
      nearNum +
      " (차이: " +
      min +
      ")"
  );
})();
