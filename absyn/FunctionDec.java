package absyn;

public class FunctionDec extends Dec{
    int pos;
    NameTy result;
    String func;
    VarDecList params;
    CompoundExp body;
    
    public FunctionDec(int pos, NameTy result, String func, VarDecList parmas, CompoundExp body){
        this.pos=pos;
        this.result=result;
        this.func=func;
        this.params=params;
        this.body=body;
    }
}