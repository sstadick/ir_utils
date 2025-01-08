import compile
from builtin._location import __call_location
from os.path import dirname, join


@value
struct Setting:
    var kind: StringLiteral
    var ext: StringLiteral


fn dump_ir[
    Fn: AnyTrivialRegType, //, f: Fn, name: StringLiteral = "out"
](dir: String = "/tmp"):
    alias l = List(Setting("llvm", "ll"), Setting("asm", "s"))
    print(compile.get_linkage_name[f]())
    # dir = dirname(__call_location[inline_count=0]().file_name)

    @parameter
    for i in range(len(l)):
        alias s = l[i]
        ir = compile._internal_compile_code[f, emission_kind = s.kind]()
        print("-", full_path := join(dir, name + "." + s.ext))
        try:
            with open(full_path, "w") as f:
                f.write(str(ir))
        except e:
            print("error:", e)
