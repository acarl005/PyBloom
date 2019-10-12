# cython: language_level = 3
cimport cbloom

cdef class BloomFilter:
    cdef cbloom.BloomFilter* _bf

    def __cinit__(self, items_count: long, fp_prob: float):
        self._bf = cbloom.bloom_filter_new(items_count, fp_prob)
        if self._bf is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if self._bf is not NULL:
            cbloom.bloom_filter_free(self._bf)

    @property
    def capacity(self):
        return self._bf.capacity

    @property
    def hash_count(self):
        return self._bf.hash_count

    @property
    def size(self):
        return self._bf.size

    def add(self, key: bytes):
        cbloom.bloom_filter_add(self._bf, key)

    def might_contain(self, key: bytes) -> bool:
        return cbloom.bloom_filter_might_contain(self._bf, key)

    def false_positive_prob(self) -> float:
        return cbloom.bloom_filter_false_positive_prob(self._bf)
