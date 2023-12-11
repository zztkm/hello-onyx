# Hello Onyx !

## Onyx commands

### help
```
❯ onyx help
Onyx toolchain version v0.1.8
Built on Wed Nov 29 01:48:14 2023
Runtime: wasmer

The toolchain for the Onyx programming language, created by Brendan Hansen.

Usage:
        onyx <subcommand>

Subcommands:
        help      Shows this help message. Use "onyx help <subcommand>".
        build     Compiles an Onyx program into an executable.
        run       Compiles and runs an Onyx program, all at once.
        check     Checks syntax and types of an Onyx program.
        watch     Continuously rebuilds an Onyx program on file changes.
        package   Package manager
        version   Prints version information
```

### Run program
```bash
onyx run main.onyx
```

### Build program
```bash
$ onyx build main.onyx

$ ls
main.onyx out.wasm

# そのまま wasmer で実行できると思ったけどだめだった
$ wasmer run out.wasm
error: Unable to compile "out.wasm"
╰─▶ 1: WebAssembly translation error: Error when converting wat: input bytes aren't valid utf-8
```

`onyx help build` を見たところ、runtime に wasi を指定してやる必要がありそう(onyx, wasi, js, custom が指定可能、default は onyx)。

```bash
$ onyx build --runtime wasi -o wasi.wasm main.onyx 

$ wasmer run wasi.wasm
hello onyx!%  
```

### Check program
```bash
onyx check main.onyx
```

エラーがあれば、エラー内容が表示される。
```bash
(/home/zztkm/dev/sandbox/onyx/hello/main.onyx:5,1) expected token ';', got '}'.
 5 | }
```

### Watch program

web server 書いたり、ゲーム書いたりしてるときに便利そう。
```bash
onyx watch main.onyx
```