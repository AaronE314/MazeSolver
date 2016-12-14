class Cell {

  private int i, j;
  private int x, y;
  private boolean[] walls = {true,true,true,true}; // top, right, bottom, left
  private boolean visited = false;
  private boolean start = false;
  private boolean end = false;

  Cell(int i, int j) {
    this.i = i;
    this.j =j;
  }

  public void show() {
    x = i*SIZE;
    y = j*SIZE;
    stroke(255);
    if(walls[0]){line(x, y, x+SIZE, y);}
    if(walls[1]){line(x+SIZE, y, x+SIZE, y+SIZE);}
    if(walls[2]){line(x+SIZE, y+SIZE, x, y+SIZE);}
    if(walls[3]){line(x, y+SIZE, x, y);}
    
    if(visited) {
      if(start){
        fill(99,220,18,100);
        noStroke();
        rect(x,y,SIZE,SIZE);
      } else if(end){
        fill(210,37,37,100);
        noStroke();
        rect(x,y,SIZE,SIZE);
      } else {
        fill(255,0,255,100);
        noStroke();
        rect(x,y,SIZE,SIZE);
      }
    }
    
  }
  
  public void highlight(){
    if(!start && !end){
      int x = i*SIZE;
      int y = j*SIZE;
      noStroke();
      fill(0, 0, 255, 100);
      rect(x, y,SIZE, SIZE);
    }
  }
  
  public Cell checkNeighbors(){
    ArrayList<Cell> neighbors = new ArrayList<Cell>();
    
    Cell top, right, bottom, left;
    
    if(index(i,j-1) != -1){
      top = grid.get(index(i,j-1));
      if(!top.visited){
        neighbors.add(top);
      }
    }
    
    if(index(i+1,j) != -1){
      right = grid.get(index(i+1,j));
      if(!right.visited){
        neighbors.add(right);
      }
    }
    
    if(index(i,j+1) != -1){
      bottom = grid.get(index(i,j+1));
      if(!bottom.visited){
        neighbors.add(bottom);
      }
    }
    
    if(index(i-1,j) != -1){
      left = grid.get(index(i-1,j));
      if(!left.visited){
        neighbors.add(left);
      }
    }
    
    if(neighbors.size() > 0) {
      int r = floor(random(0, neighbors.size()));
      
      return neighbors.get(r);
    } else {
      
      return null; 
    }
  }
}