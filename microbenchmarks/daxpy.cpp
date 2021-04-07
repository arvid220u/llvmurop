using namespace std;
#include <vector>
//#include <cilk/cilk.h>
#include <iostream>
#include "fasttime.h"

#define cilk_for for

void daxpy_forrange(vector<pair<double, double>> yx, double a) {
    cilk_for (auto &yxi : yx) {
        yxi.first = a * yxi.second;
    }
}
void daxpy_for(vector<pair<double, double>> yx, double a) {
    cilk_for (int i = 0; i < yx.size(); i++) {
        yx[i].first = a * yx[i].second;
    }
}

void daxpy_test(void (*f)(vector<pair<double, double>>, double), string desc, int N) {
    cout << "RUNNING TEST: " << desc << " (" << N << " iters)" << endl;

    vector<pair<double, double>> v(N);
    for (int i = 0; i < N; i++) {
        v[i] = make_pair(double(rand()), double(rand()));
    }

    double a = double(rand());

    vector<pair<double, double>> v2(v);
    fasttime_t time1 = gettime();
    f(v2, a);
    fasttime_t time2 = gettime();
    
    // verify result
    f(v, a);
    for (int i = 0; i < N; i++) {
        assert(v[i] == v2[i]);
    }

    // print time
    double elapsed = tdiff(time1, time2);
    printf("Elapsed execution time: %f sec\n", elapsed);
}

int main()
{
    srand(time(0));

    int N;
    cin >> N;

    string kind;
    cin >> kind;

    if (kind.find("range") != string::npos) {
        daxpy_test(daxpy_forrange, "daxpy_forrange", N);
    } else {
        daxpy_test(daxpy_for, "daxpy_for", N);
    }

    return 0;
}
