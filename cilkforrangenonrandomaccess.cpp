using namespace std;
#include <vector>
#include <cilk/cilk.h>
#include <iostream>
#include <unordered_set>
#include <string>

int functionwithuniquename(unordered_set<string> v) {
    cilk_for (auto x : v) {
        cout << x << endl;
    }
    return 0;
}

int main()
{
    unordered_set<string> v({"a","b","c"});
    int x = functionwithuniquename(v);

    return 0;
}
