from pybloom import BloomFilter

bf = BloomFilter(50, 0.1)
print(bf.capacity, bf.hash_count)

bf.add(b"food")
bf.add(b"bar")

print(bf.might_contain(b"food"))
print(bf.might_contain(b"sushi"))
print(bf.false_positive_prob())
