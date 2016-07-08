nouns
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

person - bike - docking_station - bike

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

person - bike - bike

verbs
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

use - release

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

use - see - working

Objects	               Messages
person                 
bike                    is_bike_working?
docking_station         release_bike

#true# person -> is_bike_working? -> docking_station -> release_bike -> bike
#false; true# person -> is_bike_working? -> docking_station ->; person -> is_bike_working -> docking_station -> release_bike -> bike

# makers diagram
Bike <-- working? --> true/false
DockingStation <-- release_bike --> a Bike
