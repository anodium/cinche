#!/usr/bin/env python
# -*- coding: utf-8 -*-

import unittest

from cinche.cincheapp import CincheApp


class TestCincheApp(unittest.TestCase):
    """TestCase for CincheApp.
    """
    def setUp(self):
        self.app = CincheApp()

    def test_name(self):
        self.assertEqual(self.app.name, 'cinche')

    def tearDown(self):
        pass

if __name__ == '__main__':
    unittest.main()
