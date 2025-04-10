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

== Graphs
=== Isomorphism
Two graphs, $A$ and $B$ are said to be isomorphic if $exists space f : A_V -> B_V$, such that the same vertices stay connected. Denoted as $A tilde.equiv B$.

Two graphs that are isomorphic must have:
- The same number of:
	- Vertices (of any given degree)
	- Edges
	- Cycles/Circuits (of any given length)
- Same connectedness
- Same degree sequence (list of degrees in decreasing order)
- Cycle types

A graph is #underline[_connected_] if there is a path between every pair of vertices in the graph. (this might be slightly wrong, you should probably read the question closely)

=== (Spanning) Trees
A graph, $B$ is said to be a #underline[_spanning_] graph of $A$ if $forall v in A_V, v in B_V$. There may be variation in edges.

A #underline[_tree_] is a graph where each vertex only has one incoming edge, except for one (the root).

Tree Facts:
- Any tree with $n$ vertices has $n - 1$ edges.
- Any #underline[_connected_] graph with $n$ vertices and $n - 1$ edges is necessarily a tree.

Minimal Spanning Trees:
- A spanning tree with the least total weight.
- If a graph has unique edge weights, it has a unique MST; otherwise, it may have many correct MSTs

#underline[_Prim's Algorithm_]:
+ Start at any vertex, highlight it.
+ Identify all edges coming out of that vertex and choose the edge with the least weight.
+ While we still have unvisited vertices:
	#enum(numbering: "a.")[
		Identify all edges coming out of all visited vertices to unvisited vertices
	][
		Choose the edge with the minimum cost
	]

#underline[_Kruskal's Algorithm_]:
+ Start with an empty graph $T$
+ While we still have less than $n - 1$ edges:
	#enum(numbering: "a.")[
		Identify an edge of minimum weight in $G$
	][
		If adding this edge to $T$ doesn't form a cycle, then add it to $T$ and delete it from $G$
	]

=== Adjacency Matrices
- Raising an adjacency matrix to the $n$-th power tells how many walks of length $n$ there are between two vertices.
- Adding $M^1 + M^2 + M^3 + dots.c + M^k$ gives the number of nontrivial walks of length $k$ or less.

Relations can be expressed as graphs.
- A relation $R$ is transitive $<=>$ $M^2 <= M$, where $M$ is the adjacency matrix for $R$.

=== Trails, Walks, Cycles
- #underline[_Walk_]: a list of alternating vertices and edges.
	- In a simple graph, there is no need to indicate the edges.
	- The length of a walk is its number of edges.
	- A walk is trivial if its length is 0.
	- A walk is _closed_ if it starts and ends on the same vertex.
- #underline[_Trail_]: a walk with no repeated edges.
- #underline[_Circuit_]: a closed trail.
- #underline[_Path_]: a walk with no repeated vertices.
- #underline[_Cycle_]: a nontrivial circuit in which the only repeated vertex is the first/last one.

=== Eulerianness
- A trail or circuit is _Eulerian_ if it uses every edge in the graph exactly once (allowing for revisiting vertices).
- A graph is Eulerian if it has an Eulerian trail/circuit containing every edge (technically, semi-Eulerian if only a trail).
- A graph is only Eulerian if every vertex has an even degree.
- A graph is semi-Eulerian if only $0$ or $2$ vertices have an odd degree.
- A Hamiltonian cycle is one that visits each vertex exactly once (allowing for revisiting edges).

#colbreak()


== Counting
#image("counting.png", width: 85%, )

- #underline[_Rule of Products_]: If there are $n$ ways to do task $A$ and $m$ ways to do task $B$ regardless of how $A$ was performed, then there are $m dot n$ ways to do $A B$.
- #underline[_Rule of Sums_]: If there are $n$ ways to do task $A$ and $m$ ways to do task $B$, then there are $m + n$ ways to do task $A$ or $B$ but not both.
- #underline[_Choose_]: $binom(n, r) = n!/(r!(n-r)!)$ #h(34pt) #underline[_Permute_]: $P(n, r) = n!/(n-r)!$ 

=== Example Problems
put shit here please in the morning!!!! you got this!!!!! it can't be that hard!!!!!!!

Test 3 Logistics:
- Counting (No probability)
	- *Counting problems*
	- How many functions are there between two sets
	- Bag of candies problems w/ restrictions INCLUDING the apples/oranges type restrictions
	- Committee-style problems
	- One of the piazza puzzles is on the test basically (a variation)