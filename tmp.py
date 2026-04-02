def dp(x,y,limit):
  if limit <= 1:
    return 0
  # target is (x, y)

  dp = [[[[0,0] for x in range(limit)] for i in range(y + 1)] for _ in range(x + 1)]

  for i in range(1, limit):
    if i < x+1:
      dp[i][0][i][0] = 1
    if i < y+1:
      dp[0][i][i][1] = 1
  for i in range(1, x+1):
    for j in range(1, y+1):
      for k in range(1,limit):
        dp[i][j][k][0] = dp[i-1][j][k-1][0]
        dp[i][j][k][1] = dp[i][j-1][k-1][1]
        dp[i][j][1][0] += dp[i-1][j][k][1]
        dp[i][j][1][1] += dp[i][j-1][k][0]


  for row in dp:
    print(row)
  
  return sum([sum(dp[-1][-1][i]) for i in range(limit)])
