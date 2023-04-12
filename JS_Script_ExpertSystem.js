// here is an example JavaScript code to interact with the Prolog expert system using the SWI-Prolog JavaScript interface:

const pl = require('swipl');
const assert = require('assert');

// Start a SWI-Prolog engine
pl.create();

// Load the Prolog file containing the expert system rules and facts
pl.consult('expert_system.pl', success => {
  assert(success, 'Failed to load expert_system.pl');

  // Query the Prolog engine for eligible heirs
  const solutions = [];
  pl.query('eligible_heir(X)', {
    success: solution => solutions.push(solution.X),
    error: err => console.error(err),
    done: () => console.log(solutions)
  });
});