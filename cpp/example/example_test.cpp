#include "example.h"
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_CASE(add_2_and_2)
{
    BOOST_REQUIRE_EQUAL(4, example::add(2, 2));
}

BOOST_AUTO_TEST_CASE( add_12_and_24 )
{
    BOOST_REQUIRE_EQUAL( 36, example::add( 12, 24 ) );
}

BOOST_AUTO_TEST_CASE( add_100_and_1 )
{
    BOOST_REQUIRE_EQUAL( 101, example::add( 100, 1 ) );
}

BOOST_AUTO_TEST_CASE( add_2_and_minus_2 )
{
    BOOST_REQUIRE_EQUAL( 0, example::add( 2, -2 ) );
}