after much trial and error, it seems like the following steps are sufficient for building opencilk on a mac.

1. `git clone git@github.com:opencilk/opencilk-project`
2. `cd opencilk-project`
3. `git clone git@github.com:OpenCilk/cheetah`
4. `mkdir build`
5. `cd build`
6. `brew install ninja`
7. `cmake -DLLVM_ENABLE_PROJECTS="clang;cheetah;libcxx;libcxxabi" -DDEFAULT_SYSROOT="$(xcrun --show-sdk-path)" -G Ninja ../llvm`
8. `ninja`

it takes around 2 hours on my Macbook Pro from 2015 to do the last step.

you should now be able to compile any `cpp` file using `~/path/to/opencilk-project/build/bin/clang++`.


## useful references

1. for llvm: https://quuxplusone.github.io/blog/2019/11/09/llvm-from-scratch/
2. for opencilk: https://github.com/OpenCilk/infrastructure/blob/release/INSTALLING
