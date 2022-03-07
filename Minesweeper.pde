import de.bezier.guido.*;

//Declare and initialize constants NUM_ROWS and NUM_COLS = 20
private final static int NUM_ROWS = 5;
private final static int NUM_COLS = 5;
private final static int NUM_MINES = 2;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> mines = new ArrayList <MSButton> (); //ArrayList of just the minesweeper buttons that are mined

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
  while (mines.size() < NUM_MINES) {
    int rowNum = (int)(Math.random()*NUM_ROWS); 
    int colNum = (int)(Math.random()*NUM_COLS);
    if (!mines.contains(buttons[rowNum][colNum])) {
      mines.add(buttons[rowNum][colNum]);
      System.out.println(rowNum + " , " + colNum);
    }
  }
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
  // if the blank swquares = the number of mines
  int emptyButtons = 0;
  for (int r = 0; r<NUM_ROWS; r++) {
    for (int c =0; c<NUM_COLS; c++) {
      if (buttons[r][c].clicked == false)
        emptyButtons++;
    }
  }
  if (emptyButtons >NUM_MINES && !mines.contains(emptyButtons))
    return false;
  return true;
}

public void displayLosingMessage()
{
  buttons[0][0].setLabel("You Lose");
for(int r = 0; r< NUM_ROWS; r++)
  for(int c = 0; c<NUM_COLS; c++)
    buttons[r][c].mousePressed();
}


public void displayWinningMessage()
{
  //your code here
  buttons[0][0].setLabel("You win!");
}

public boolean isValid(int r, int c)
{
  //your code here
  if (r >=0 && c >= 0 && r<NUM_ROWS && c < NUM_COLS)
    return true;
  return false;
}

public int countMines(int row, int col)
{
  int numMines = 0;
  //your code here
  for (int r = row-1; r<=row+1; r++) {
    for (int c = col-1; c<=col+1; c++) {
      if (isValid(r, c) && mines.contains(buttons[r][c])==true)
        numMines++;
      System.out.println(numMines);
      if (mines.contains(buttons[row][col])==true)
        numMines--;
      System.out.println(numMines);
    }
  }
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
  public void mousePressed() 
  {
    clicked = true;

    //if position to left is valid and flagged/blank
    //if (isValid(myRow, myCol-1) == true && buttons[myRow][myCol-1].isFlagged() == true) {
    //  buttons[myRow][myCol-1].mousePressed();
    //}
    //for(int r = NUM_ROWS-1;r<=NUM_ROWS+1;r++)
    //  for(int c = NUM_COLS-1; c<=NUM_COLS+1;c++)
    //    if(isValid(r,c) == true && buttons[r][c].isFlagged() == true)
    //        buttons[r][c].mousePressed();
    ////  }
    //}
    if (mouseButton == RIGHT)
      clicked = !clicked;
    else if (mines.contains(this))
      displayLosingMessage();
    else if (countMines(myRow, myCol) >0)
      buttons[myRow][myCol].setLabelNumber(countMines(myRow, myCol));
    else {
      for (int r = NUM_ROWS-1; r<=NUM_ROWS+1; r++)
        for (int c = NUM_COLS-1; c<=NUM_COLS+1; c++)
          if (isValid(r, c) == true && buttons[r][c].isFlagged() == true)
            buttons[r][c].mousePressed();
    }
  }
  //your code here

  public void draw () 
  {    
    if (flagged)
      fill(0);
    else if ( clicked && mines.contains(this) ) 
      fill(255, 0, 0);
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

  public void setLabelNumber(int newLabel)
  {
    myLabel = ""+ newLabel;
  }

  public boolean isFlagged()
  {
    return flagged;
  }
}
