class Solver{
  
  Cell current;
  
  boolean solved = false;
  
  private ArrayList<Cell> Sol = new ArrayList<Cell>();
  
  Solver(){
    current = grid.get(0);
    current.sol = true;
    current.solCh = true;
  }
  
  public void solve(){
    
    if(!solved){
      Cell next = checkWalls(current);
  
      if (next != null) {
        next.sol = true;
        next.solCh = true;
        
        //STEP 2
        Sol.add(current);
        
        //STEP 4
        current = next;
      } else {
        if(Sol.size() != 0){
          current.sol = false;
          //Sol.get(Sol.size()-1).sol = false;
          current = Sol.remove(Sol.size()-1);
        }
      }
      
      if(current.end){
        solved = true;
      }
    }
  }
  
  public Cell checkWalls(Cell checking){
    ArrayList<Cell> neighbors = new ArrayList<Cell>();
    
    //for(int i =0; i<4; i++){
    //  int w = 0;
    //  if(!checking.walls[i]) {
    //    w++;
    //  }
    //}
    
    Cell top, right, bottom, left;
    
    if(!checking.walls[0]){
      top = grid.get(index(checking.i,checking.j-1));
      if(!top.sol && !top.solCh){
        neighbors.add(top);
      }
    }
    
    if(!checking.walls[1]){
      right = grid.get(index(checking.i+1,checking.j));
      if(!right.sol && !right.solCh){
        neighbors.add(right);
      }
    }
    
    if(!checking.walls[2]){
      bottom = grid.get(index(checking.i,checking.j+1));
      if(!bottom.sol && !bottom.solCh){
        neighbors.add(bottom);
      }
    }
    
    if(!checking.walls[3]){
      left = grid.get(index(checking.i-1,checking.j));
      if(!left.sol && !left.solCh){
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