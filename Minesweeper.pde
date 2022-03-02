import de.bezier.guido.*;
//Declare and initialize constants NUM_ROWS and NUM_COLS = 20
private final static int NUM_ROWS = 5;
private final static int NUM_COLS = 5;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> mines; //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
  size(400, 400);
  textAlign(CENTER, CENTER);

  // make the manager
  Interactive.make( this );

  //your code to initialize buttons goes here
  buttons = new MSButton[NUM_ROWS][NUM_COLS];
  for (int r = 0; r < NUM_ROWS; r++) {
    for (int c = 0; c < NUM_COLS; c++) {
      buttons[r][c] = new MSButton(r, c);
    }
  }



  setMines();
}
public void setMines()
{
  //your code
}

public void draw ()
{
  background( 0 );
  if (isWon() == true)
    displayWinningMessage();
}
public boolean isWon()
{
  //your code here
  return false;
}
public void displayLosingMessage()
{
  //your code here
}
public void displayWinningMessage()
{
  //your code here
}
public boolean isValid(int r, int c)
{
  //your code here
  return false;
}
public int countMines(int row, int col)
{
  int numMines = 0;
  //your code here
  return numMines;
}
public class MSButton
{
  private int myRow, myCol;
  private float x, y, width, height;
  private boolean clicked, flagged;
  private String myLabel;

  public MSButton ( int row, int col )
  {
    width = 400/NUM_COLS;
    height = 400/NUM_ROWS;
    myRow = row;
    myCol = col; 
    x = myCol*width;
    y = myRow*height;
    myLabel = "";
    flagged = clicked = false;
    Interactive.add( this ); // register it with the manager
  }

  // called by manager
  public void mousePressed () 
  {
    clicked = true;
    //your code here
  }
  public void draw () 
  {    
    if (flagged)
      fill(0);
    // else if( clicked && mines.contains(this) ) 
    //     fill(255,0,0);
    else if (clicked)
      fill( 200 );
    else 
    fill( 100 );

    rect(x, y, width, height);
    fill(0);
    text(myLabel, x+width/2, y+height/2);
  }
  public void setLabel(String newLabel)
  {
    myLabel = newLabel;
  }
  public void setLabel(int newLabel)
  {
    myLabel = ""+ newLabel;
  }
  public boolean isFlagged()
  {
    return flagged;
  }
}


//RECURSIVE BUTTON PRESSING
/*
import de.bezier.guido.*;
private Blob[][] blobs; 

void setup ()
{
  size(400, 400);
  // make the manager
  Interactive.make( this );
  blobs = new Blob[10][10];
  for (int r = 0; r < 10; r++)
    for (int c = 0; c < 10; c++)
      blobs[r][c] = new Blob(r, c);
}
void draw() {
}//empty

public class Blob
{
  private int r, c;
  private float x, y, width, height;
  private boolean marked;

  public Blob ( int rr, int cc )
  {
    width = 40;
    height = 40;
    r = rr;
    c = cc; 
    x = c*width;
    y = r*height;
    marked = Math.random() < .5;
    Interactive.add( this ); // register it with the manager
  }
  public boolean isMarked()
  {
    return marked;
  }
  public boolean isValid(int row, int col)
  {
    if (row>=0 && row<10 && col>=0 && col<10)
      return true;
    else
      return false;
  }

  public void mousePressed() 
  {
    marked = false;
    //your code here
    //if position to left is valid and marked
    if(isValid(r,c-1) == true && blobs[r][c-1].isMarked() == true){
      blobs[r][c-1].mousePressed();
    }
      
    //call mousePressed for the blob on left
  }
  public void draw () 
  {    
    if (marked)
      fill(50);
    else 
    fill( 255 );

    rect(x, y, width, height);
    fill(0);
  }
}

*/
