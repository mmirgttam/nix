{
  extraFiles = {
    "ftplugin/c.lua".text = builtins.readFile ./ftplugins/c.lua;
    "ftplugin/cpp.lua".text = builtins.readFile ./ftplugins/cpp.lua;
    "ftplugin/lua.lua".text = builtins.readFile ./ftplugins/lua.lua;
    "ftplugin/python.lua".text = builtins.readFile ./ftplugins/python.lua;
    "ftplugin/lazygit.lua".text = builtins.readFile ./ftplugins/lazygit.lua;
  };
}
