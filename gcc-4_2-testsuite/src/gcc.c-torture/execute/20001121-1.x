# This is not currently supported by clang when unoptimized.
# http://clang.llvm.org/compatibility.html#inline
# Do not run at -O0.
set torture_eval_before_compile {
    set compiler_conditional_xfail_data {
        "This is not currently supported by clang when unoptimized" \
        { "*-*-*" } \
        { "-O0" } \
        { "-O1 -O2 -O3" }
    }
}

return 0
