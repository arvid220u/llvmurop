using namespace std;
#include <vector>
#include <cilk/cilk.h>
#include <iostream>
#include <string>

int functionwithuniquename(vector<int> v) {
    cilk_for (int x : v);
    return 0;
}

int main()
{
    int N = 64;
    vector<int> v(N);
    for (int i = 0; i < N; i++) {
        v[i] = i;
    }
    int x = functionwithuniquename(v);

    return 0;
}
