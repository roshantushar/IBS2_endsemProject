int n=8;//8*8 check board
int WIDTH = 500;//width
int HEIGHT = 500;//height
int BLOCKX = WIDTH / n;//width of each block
int BLOCKY = HEIGHT / n;//height of each block

void setup() 
{
  size(500, 500);//window size
  chessBoard();//to draw the chess board 
  startKnightTour();//to start the knights tour process
}

//function to draw chess board create a chess board 
void chessBoard()
{
  for (int i = 0; i < 8; i ++) {
    for (int j = 0; j < 8; j ++) {
      if ((i + j + 1) % 2 == 0) {
        fill(255, 255, 255); // white
      } else {
        fill(0, 0, 0); // black
      }
      rect(i * BLOCKX, j * BLOCKY, (i + 1) * BLOCKX, (j + 1) * BLOCKY);//draw the boxes of desired dimension
    }
  }
}

//to draw the knights tour 
void drawline(int a, int b, int c, int d, String s)
{
  strokeWeight(4);
  stroke(0, 0, 200);//blue line 
  line(a*BLOCKX-(BLOCKX/2), b*BLOCKY-(BLOCKY/2), BLOCKX*c-(BLOCKX/2), BLOCKY*d-(BLOCKY/2));
  //to draw line from one spot to other spot
  fill(255, 0, 0);
  textSize(10);
  text(s, BLOCKX*c-(BLOCKX/2), BLOCKY*d-(BLOCKY/2));//to display the number
}
