#include <cxxtest/TestSuite.h>

class Tests : public CxxTest::TestSuite
{
public:

   CXXTEST_STD(list)<int>* cache;

   void setUp()
   {
      this->cache = new CXXTEST_STD(list)<int>();
   }

   void tearDown()
   { }

   void test_size()
   {
      TS_ASSERT_EQUALS(cache->size(), 0);
   }

   void test_insert()
   {
      this->cache->push_back(1);
      TS_ASSERT_EQUALS(cache->size(), 1);
   }

};


class InheritedTests : public Tests
{
public:

};

