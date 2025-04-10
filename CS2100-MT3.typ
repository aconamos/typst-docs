#set page(
  "us-letter",
  margin: 0.25in,
  columns: 2
)

#set text(
  size: 8pt // go to 8 when done
)

// This show rule requires page breaks between every top-level header.
// This is not scuffed at all and I totally know what I am doing.
#show heading.where(level: 1): body => {
  // For the top-level header, escape the two-column restriction and align with the page's top and center.
  place(
    top + center,
    float: true,
    scope:"parent",
    body
  )
}

Test 3 Logistics:
- Graphs
- Counting (No probability)
- Week 8, 10, 11, 12
- Snapshot document covers *all* necessary topics; the topics on the test are the union of the snapshot document topics?
- 9 questions, 100 points, 1 extra credit on Dijkstra's
	- *Graph Problems*
	- T/F w/ Justification (15 pts)
	- Graphs, walks, trails, path, graph isomorphism, non-isomorphism
	- Reasons for isomorphisms
	- Number of integers that are multiples of something
	- Prim's and Kruskal's algorithms
	- Hamiltonian cycles/Euler trails/Euler cycles (?)
	- Matrix multiplication (lin alg)
	- Pigeonhole
	- Counting the number of edges, vertices in "special" graphs
	- *Counting problems*
	- How many functions are there between two sets
	- Bag of candies problems w/ restrictions INCLUDING the apples/oranges type restrictions
	- Committee-style problems
	- One of the piazza puzzles is on the test basically (a variation)