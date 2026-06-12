class NthPrime {
  int prime(int n) {
    if (n == 0) throw ArgumentError('There is no zeroth prime');

    final primes = [2];
    for (int candidate = 3; primes.length < n; candidate++)
      if (!primes.any((prime) => candidate % prime == 0)) primes.add(candidate);
    return primes.last;
  }
}
