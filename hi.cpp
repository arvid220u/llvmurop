using namespace std;
#include <vector>
#include <cilk/cilk.h>

int functionwithuniquename(vector<int> v) {
    int sum = 0;
    /*for (auto x : v) {
        sum += x;
    }*/
    cilk_for (int i = 0; i < 2; i++) {
        sum += v[i];
    }
    return sum;
}

int main()
{
    int x = functionwithuniquename({1,2});

    return 0;
}
