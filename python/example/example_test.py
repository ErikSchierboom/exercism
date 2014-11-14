# -*- coding: utf-8 -*-

from __future__ import unicode_literals
import unittest

import example


class ExampleTests(unittest.TestCase):

    def test_add_2_and_2(self):
        self.assertEqual(
            4,
            example.add(2, 2)
        )

    def test_add_12_and_24(self):
        self.assertEqual(
            36,
            example.add(12, 24)
        )

    def test_add_100_and_1(self):
        self.assertEqual(
            101,
            example.add(100, 1)
        )

    def test_add_2_and_minus_2(self):
        self.assertEqual(
            0,
            example.add(2, -2)
        )

if __name__ == '__main__':
    unittest.main()
