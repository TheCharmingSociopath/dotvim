#include<bits/stdc++.h>
using namespace std;

#include <ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/tree_policy.hpp>
using namespace __gnu_pbds;

#pragma GCC optimize("Ofast")
#pragma GCC target("sse,sse2,sse3,ssse3,sse4,popcnt,abm,mmx,avx,tune=native")
#pragma GCC optimize("unroll-loops")

// TRACE FOR DEBUGGING
#define TRACE

#ifdef TRACE
#define trace(...) __f(#__VA_ARGS__, __VA_ARGS__)
template <typename Arg1>
void __f(const char* name, Arg1&& arg1){
    cerr << name << " : " << arg1 << std::endl;
}
template <typename Arg1, typename... Args>
void __f(const char* names, Arg1&& arg1, Args&&... args){
    const char* comma = strchr(names + 1, ',');cerr.write(names, comma - names) << " : " << arg1<<" | ";__f(comma+1, args...);
}
#else
#define trace(...)
#endif
// TRACE FOR DEBUGGING

#define pb push_back
#define mp make_pair
#define ff first
#define ss second
#define endl "\n"

#define FOR(i, st, n) for (int i = st; i < n; ++i)
#define RFOR(i, st, n) for (int i = st; i >= n; --i)
#define sz(a) (ll)(a).size()
#define all(a) a.begin(), a.end()

#define tests int num_test; cin >> num_test; while (num_test--)
#define fast_std_io ios::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);

typedef long long int ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;
typedef vector<int> vi;
typedef vector<ll> vll;
typedef tree<int, null_type, less<int>, rb_tree_tag, tree_order_statistics_node_update> ordered_set;
typedef tree<int, int, less<int>, rb_tree_tag, tree_order_statistics_node_update> ordered_map;
typedef pair<double, double> Point;

//K-th smallest
//cout << k << "rd smallest: " << *A.find_by_order(k-1) << endl;
//NO OF ELEMENTS < X
//cout << "No of elements less than " << X << " are " << A.order_of_key(X) << endl;

const int maxn = 200010;
const ll mod = 1000000007;
// vector<int> adj[maxn];
// bool visited[maxn];

ll fact(ll n) {
    ll ret = 1;
    FOR(i, 1, n+1) {
        ret = (ret * i) % mod;
    }
    return ret;
}

ll power(ll a, ll n) {
    ll ret = 1;
    while (n > 0) {
        if (n & 1) {
            ret = (ret * a) % mod;
        }
        a = (a*a) % mod;
        n >>= 1;
    }
    return ret;
}

int main()
{
    fast_std_io;

    return 0;
}
