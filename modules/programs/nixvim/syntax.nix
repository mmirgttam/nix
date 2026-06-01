{
  extraFiles = {
    "syntax/mlir.vim".text = builtins.readFile ./syntax/mlir.vim;
    "syntax/tablegen.vim".text = builtins.readFile ./syntax/tablegen.vim;
  };
}
