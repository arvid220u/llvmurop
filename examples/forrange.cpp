using namespace std;
#include <vector>
#include <iostream>

int functionwithuniquename(vector<int> v) {
    for (int x : v) {
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
    int x = functionwithuniquename(v);

    return 0;
}
