using namespace std;
#include <vector>
#include <cilk/cilk.h>
#include <iostream>
#include <unordered_set>

int functionwithuniquename(unordered_set<int> s) {
    cilk_for (auto x : s) {
        cout << x << endl;
    }
    return 0;
}

int main()
{
    int N = 64;
    vector<int> v(N);
    for (int i = 0; i < N; i++) {
        v[i] = i;
    }
    unordered_set<int> s(v.begin(), v.end());
    int x = functionwithuniquename(s);

    return 0;
}
