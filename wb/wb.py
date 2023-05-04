# Create a function that given a list which represents street lights given as a parameter(l_street), determine if an outage has occurred. A street with a total number of "F" greater than or equal to 2 returns "Outage", anything below returns "Power"
# Example Input: [ 'T', 'F', 'F', 'F' ]
# Example Output: "Outage"

def determine_outage(l_street):
    count = 0
    for light in l_street:
        if light == 'F':
            count += 1
    return 'Outage' if count >= 2 else 'Power'

print(determine_outage([ 'T', 'F', 'F', 'F' ]))
print(determine_outage([ 'T', 'F', 'T', 'T', 'T' ]))