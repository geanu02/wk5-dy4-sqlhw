import unittest
from wb import determine_outage

class TestStreetLights(unittest.TestCase):
    def test_outage(self):
        self.assertEqual(determine_outage(['T', 'F', 'F', 'F']), 'Outage')
        
    def test_power(self):
        self.assertEqual(determine_outage(['T', 'T', 'F']), 'Power')
        
    def test_empty_list(self):
        self.assertEqual(determine_outage([]), 'Power')
        
    def test_single_light(self):
        self.assertEqual(determine_outage(['T']), 'Power')
        
    def test_all_lights_out(self):
        self.assertEqual(determine_outage(['F', 'F', 'F']), 'Outage')

if __name__ == '__main__':
    unittest.main()