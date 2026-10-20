{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    clang-tools
    cmake
  ];

  plugins = {
    clangd-extensions = {
      enable = true;
      enableOffsetEncodingWorkaround = true;
    };

    lsp.servers.clangd = {
      enable = true;
      cmd = [
        "clangd"
        "--background-index"
        "--clang-tidy"
        "--header-insertion=iwyu"
        "--completion-style=detailed"
        "--function-arg-placeholders"
        "--fallback-style=llvm"
      ];
    };

    conform-nvim.settings.formatters_by_ft = {
      c = [ "clang_format" ];
      cpp = [ "clang_format" ];
    };
  };

  globals.project_commands.c = [
    {
      files = [ "CMakeLists.txt" ];
      run = "cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && cmake --build build && ./build/main";
    }
    {
      files = [ "Makefile" ];
      run = "make && ./main";
    }
    {
      files = [ "main.cpp" ];
      run = "g++ -O2 -std=c++20 main.cpp -o main && ./main";
    }
    {
      files = [ "main.c" ];
      run = "gcc -O2 main.c -o main && ./main";
    }
  ];
}
