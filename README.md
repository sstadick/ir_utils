# ir\_utils

Package version of [this](https://forum.modular.com/t/seeing-the-mlir-llvm-or-asm-code-generated-by-mojo/250/5?u=duck_tape) from @soraros.
Linked [gist](https://gist.github.com/soraros/44d56698cb20a6c5db3160f13ca81675)

## Usage

```python
import math
from sys.intrinsics import assume

from ir_utils.dump import dump_ir

fn main():
  dump_ir[f, "out1"](dir="./")
  dump_ir[g, "out2"](dir="/tmp)

@export  # use `export` so get cleaner names
fn f(x: Int) -> Int:
  assume(0 <= x < 100)
  return max(1, x * 2)

@export
fn g(x: Int) -> Int:
  assume(0 <= x < 100)
  return x * 2 + int(x == 0)
```
