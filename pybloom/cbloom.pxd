cdef extern from "bloom.h":
    ctypedef struct BloomFilter:
        unsigned int capacity;
        unsigned int size;
        int hash_count;
    
    BloomFilter* bloom_filter_new(long items_count, float fp_prob)
    BloomFilter* bloom_filter_with_capacity(unsigned int capacity, int hash_count)
    void bloom_filter_add(BloomFilter* bf, char* key)
    float bloom_filter_false_positive_prob(BloomFilter* bf)
    bint bloom_filter_might_contain(BloomFilter* bf, char* key)
    void bloom_filter_free(BloomFilter* bf)
