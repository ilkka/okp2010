#include <iostream>
#include <stdexcept>
#include <string>
using namespace std;

class OutOfRangeError : public runtime_error
{
public:
	OutOfRangeError(const string& what) : runtime_error(what) {}
};

class NotANumberError : public runtime_error
{
public:
	NotANumberError(const string& what) : runtime_error(what) {}
};

class OverflowError : public runtime_error
{
public:
	OverflowError(const string& what) : runtime_error(what) {}
};

namespace {
const int MIN = -1000;
const int MAX = 1000;

int highestOneBit(int x) {
	size_t bits = 0;
	while(x != 0) {
		++bits;
		x >>= 1;
	}
	return bits;
}

bool multiplicationIsSafe(int a, int b) {
	size_t abits = highestOneBit(a);
	size_t bbits = highestOneBit(b);
	return (abits < (sizeof(int) * 8) && bbits < (sizeof(int) * 8));
}

bool summationIsSafe(int a, int b) {
	size_t abits = highestOneBit(a);
	size_t bbits = highestOneBit(b);
	return ((abits + bbits) < (sizeof(int) * 8));
}

int abs(int x) {
	if (x < 0) {
		return -x;
	}
	return x;
}
}

int main() {
	int result = 0;
	do {
		int num = 0;
		cin >> num;
		if (!cin.eof() && cin.fail()) {
			throw NotANumberError("Not a number");
		} else {
			if (num < MIN || num > MAX) {
				throw OutOfRangeError("Out of range");
			}
		}
		if (!multiplicationIsSafe(abs(num), abs(num))) {
			throw OverflowError("Integer overflow in squaring");
		} else if (!summationIsSafe(num * num, result)) {
			throw OverflowError("Integer overflow in summation");
		}
		result += num * num;
	} while (!cin.eof());
	cout << result << endl;
	return 0;
}
