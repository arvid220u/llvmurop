using namespace std;
#include <vector>
#include <cilk/cilk.h>
#include <iostream>
#include <unordered_set>
#include <string>

int functionwithuniquename(vector<int> v) {
    int sum = 0;
    cilk_for (int x : v) {
        sum+=x;
    }
    return sum;
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
