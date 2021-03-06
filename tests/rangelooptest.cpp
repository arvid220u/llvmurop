#include <vector>
#include <utility>
#include <set>
#include <unordered_set>
#include <string>

int foo(int n);

int Cilk_for_range_tests(int n) {
  std::vector<int> v(n);
  for (int i = 0; i < n; i++) v[i] = i;

  _Cilk_for(auto x : v); // expected-warning {{Cilk for loop has empty body}}
  _Cilk_for(auto& x : v); // expected-warning {{Cilk for loop has empty body}}
  _Cilk_for(int x : v); // expected-warning {{Cilk for loop has empty body}}
  _Cilk_for(std::string x : v); // expected-error {{no viable conversion from 'int' to 'std::string'}}
  _Cilk_for(std::string x : {"a", "b"}); // expected-warning {{range-based for loop has empty body}}

  // Pairs are aggregate types, which initially had a bug. Assert that they work
  std::vector<std::pair<int,int>> vp(n);
  for (int i = 0; i < n; i++) {
    vp[i] = std::make_pair(i,i+1);
  }
  _Cilk_for(auto p : vp)
    continue;
  _Cilk_for(auto& p : vp) {
    continue;
  }

  int a[5];
  _Cilk_for(int x : a)
      continue;

  std::set<long> s(v.begin(), v.end());
  _Cilk_for(int x : s); // expected-error {{Cannot determine length with '__end - __begin'. Please use a random access iterator.}}
  std::unordered_set<long> us(v.begin(), v.end());
  _Cilk_for(int x : us); // expected-error {{Cannot determine length with '__end - __begin'. Please use a random access iterator.}}

  // Check for return statements, which cannot appear anywhere in the body of a
  // _Cilk_for loop.
  _Cilk_for (int i : v) return 7; // expected-error{{cannot return}}
  _Cilk_for (int i : v)
    for (int j = 1; j < i; ++j)
      return 7; // expected-error{{cannot return}}

  // Check for illegal break statements, which cannot bind to the scope of a
  // _Cilk_for loop, but can bind to loops nested within.
  _Cilk_for (int i : v) break; // expected-error{{cannot break}}
  _Cilk_for (int i : v)
    for (int j = 1; j < i; ++j)
      break;

  return 0;
}

int range_pragma_tests(int n) {
  std::vector<int> v(n);
  for (int i = 0; i < n; i++) v[i] = i;

#pragma clang loop unroll_count(4)
  _Cilk_for (auto i : v)
    foo(i);

#pragma cilk grainsize(4)
  _Cilk_for (int i : v)
    foo(i);

#pragma cilk grainsize 4
  _Cilk_for (int i : {1,2,3})
    foo(i);

#pragma cilk grainsize = 4 \
// expected-warning{{'#pragma cilk grainsize' no longer requires '='}}
  _Cilk_for (int i : v)
    foo(i);

  return 0;
}

int range_scope_tests(int n) {
  std::vector<int> v(n);
  for (int i = 0; i < n; i++) v[i] = i;
  int A[5];
  _Cilk_for(int i : v) {
    int A[5];
    A[i%5] = i;
  }
  for(int i : v) {
    A[i%5] = i%5;
  }
  return 0;
}
