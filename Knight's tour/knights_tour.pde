int N = 8;//8 *8 chess board 

//to check if the next move is valid 
boolean isValid(int i, int j, int sol[][]) {
  if (i>=1 && i<=N && j>=1 && j<=N) {//next move lies within the chess board  
    if (sol[i][j]==-1)
      return true;//return true if possible
  }
  return false;//retrun false if not possible
}


boolean knightTour(int sol[][], int i, int j, int stepCount, int xMove[], int yMove[]) {
  if (stepCount == N*N)//base case 
    return true;

  //recursive case
  for (int k=0; k<8; k++) {
    //movement of the knight 
    int nextI = i+xMove[k];
    int nextJ = j+yMove[k];

    if (isValid(nextI, nextJ, sol)) {//if the movement is valid
      sol[nextI][nextJ] = stepCount;// this will have the numberof move in the coressponing block
      if (knightTour(sol, nextI, nextJ, stepCount+1, xMove, yMove))
        return true;//next check
      sol[nextI][nextJ] = -1;
    }
  }

  return false;
}

//this function is to initiate and start the knights tour
boolean startKnightTour() {
  int[][] sol = new int[N+1][N+1];//solution matrix to hold the path 

  //initiallizing each pos to -1
  for (int i=1; i<=N; i++) {
    for (int j=1; j<=N; j++) {
      sol[i][j] = -1;
    }
  }
  //movement of the knight 
  int xMove[] = {2, 1, -1, -2, -2, -1, 1, 2};
  int yMove[] = {1, 2, 2, 1, -1, -2, -2, -1};



  sol[1][1] = 0; // placing knight at cell(1, 1)

  if (knightTour(sol, 1, 1, 1, xMove, yMove))//if a solution exists
  {

    //the below code is to find the x and y coordinates of blocks with the respective position
    for (int k=0; k<(N*N)-1; k++)
    {
      for (int i=1; i<=N; i++) {
        for (int j=1; j<=N; j++) {
          for (int ii=1; ii<=N; ii++) {
            for (int jj=1; jj<=N; jj++) {

              if (sol[i][j]==k && sol[ii][jj]==k+1)
              {    
                drawline(i, j, ii, jj, (k+2)+"");      //to draw a line with x1 x2 y1 y2
              }
            }
          }
        }
      }
    }
    return true;
  }
  return false;
}
