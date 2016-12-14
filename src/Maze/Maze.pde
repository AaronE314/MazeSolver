final static int SIZE = 240;
int cols, rows;
ArrayList<Cell> grid;
ArrayList<Cell> stack;
Cell current;


void setup() {
  //size(1000, 500);
  fullScreen();
  
  cols = floor(width/SIZE) - 2;
  rows = floor(height/SIZE) - 2;
  grid = new ArrayList<Cell>();
  stack = new ArrayList<Cell>();

  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      Cell cell = new Cell(x, y);
      grid.add(cell);
    }
  }
  current = grid.get(0);
  current.start = true;
  
  int endi = index(cols-1,rows-1);
  grid.get(endi).end = true;
}

void draw() {
  background(51);
  translate(SIZE,SIZE);
  
  for (int i = 0; i < grid.size(); i++) {
    grid.get(i).show();
    
  }

  current.visited = true;
  current.highlight();
  
  //STEP 1
  Cell next = current.checkNeighbors();
  
  if (next != null) {
    next.visited = true;
    
    //STEP 2
    stack.add(current);
    
    //STEP 3
    removeWalls(current,next);
    
    //STEP 4
    current = next;
  } else {
    if(stack.size() != 0){
      current = stack.remove(stack.size()-1);
    }
  }
}

public int index(int i, int j){
    if(i<0 || j < 0 || i > cols-1 || j > rows-1){
      return -1;
    }
    return i + j * cols;
  }

void removeWalls(Cell a,Cell b){
  int x = a.i-b.i;
  if(x==1){
    a.walls[3] = false;
    b.walls[1] = false;
  } else if (x==-1){
    a.walls[1] = false;
    b.walls[3] = false;
  }
  
  int y = a.j-b.j;
  if(y==1){
    a.walls[0] = false;
    b.walls[2] = false;
  } else if (y==-1){
    a.walls[2] = false;
    b.walls[0] = false;
  }
}