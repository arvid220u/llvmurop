using namespace std;
#include <vector>
#include <cilk/cilk.h>

int functionwithuniquename(vector<int> v) {
    int sum = 0;
    cilk_for (int i = 0; i < 10; i++) {
        if (sum % 2 == 0) {
            sum /= 2;
        } else {
            sum = 3*sum + 1;
        }
    }
    return sum;
}

int main()
{
    int x = functionwithuniquename({1,2});

    return 0;
}
