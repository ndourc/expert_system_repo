# here is an example Python code to interact with the Prolog expert system using the PySWIP library:

from pyswip import Prolog

# Create a Prolog object
prolog = Prolog()

# Load the Prolog file containing the expert system rules and facts
prolog.consult("expert_system.pl")

# Query the Prolog engine for eligible heirs
for solution in prolog.query("eligible_heir(X)"):
    print(solution["X"])
    