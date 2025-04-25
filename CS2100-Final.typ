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

== Definitions
=== Relations
For the following definitions, consider a relation $R$ on a set $S$.
1. #underline[_Transitivity_]: $R$ is transitive $<=>$ $(a, b) in S, (b, c) in S => (a, c) in S$.
2. 
  #underline[_Reflexivity_]: $R$ is reflexive $<=>$ $forall a in S, (a, a) in R$. 
  #linebreak()
  #underline[_Irreflexivity_]: $R$ is irreflexive $<=>$ $forall a in S, (a, a) in.not R$.
3. 
  #underline[_Symmetry_]: $R$ is symmetric $<=>$ $(a, b) in R => (b, a) in R$.
  #linebreak()
  #underline[_Antisymmetry_]: $R$ is antisymmetric $<=>$ $(a, b) and (b, a) in R => a = b$.

- #underline[_Binary Relation_]: A relation from a set to itself.
- #underline[_Equivalence Relation_]: A relation that is reflexive, symmetric, and transitive.

#underline[_Partitions_]:
For a set $A$ to be a partition of $B$, the following must be true of $A$:
1. The sets contained in $A$ must be mutually disjoint.
2. The union of the sets contained in $A$ must be $B$.
3. Every set in $A$ must $!= diameter$
- #underline[_Equivalence Class_]: $[x]$ denotes the set of all elements related to $x$.

=== Ordering
- #underline[_Partial Ordering_]: A relation $R$ on $S$ is a partial order if it is reflexive, antisymmetric, and transitive.
  - Relations with partial orders may be drawn using a Hasse diagram.
- #underline[_Total Ordering_]: A relation $R$ on $S$ is a total order if it is a partial order and $forall a, b in S, (a, b) in R.$
- #underline[_Strict Ordering_]: Partial and Total orderings are strict if they are irreflexive.

=== Function
A #underline[_Function_] is a relation $F$ on a set $X$ to a set $Y$ where every element in $X$ maps to exactly one element of set $Y$.

- #underline[_Injectivity_]: $forall (a, b) in X, f(a) = f(b) <=> a = b$
- #underline[_Surjectivity_]: $forall a in Y, exists b in X "s.t." f(b) = a$
- #underline[_Bijectivity_]: Injective and Surjective

Useful Facts:
- Composing two injective functions gives an injective function.
- 2-regular functions: $f : A -> B$ is 2-regular $<=> forall b in B, exists$ exactly two distinct $a_1, a_2 in A "s.t." f(a_1) = f(a_2) = b$.
- #underline[Within the context of this class], invertible means bijective.
  - Invertible isn't really a formally defined term, so it can vary. In other contexts, it tends to simply mean injective.

#underline[_Images_]: Given some $f : X -> Y$, The image of an input value $x$ is the set of outputs it may produce. The preimage of an output $y$ is the set of input values that produce $y$.

_Cantor-Bernstein Theorem_: Given infinite sets $A -> B$, iff $exists$ some injective function from $A -> B$, and $exists$ some injective function from $B -> A$, then $exists$ some bijective function from $A -> B$. It follows that the two sets have the same cardinality: $|A|$ = $|B|$.

=== Sets
- $P(A) = { S : S subset.eq A}$
- For a finite set $A$, if $|A| = k$, then $|P(A)| = 2^k$
- #underline[_Cartesian Product_]: $A times B = {(a, b) : a in A and b in B}$
- The dual of a statement about sets is one with each $union$ swapped with $inter$, each $inter$ swapped with $union$, each $UU$ (universal set) swapped with $diameter$, and each $diameter$ swapped with $UU$.
- Set equality: The formal definition: $A = B <=> A subset.eq B and B subset.eq A$.

== Types of Proof
=== Direct Proof
Directly show that if $p$ is true, then $q$ is true as well.
- This includes proof by induction.
1. Write the proposition
2. Start with a true hypothesis
  #linebreak()
  Through definitions, axioms, and properties, work your way to a conclusion
3. End with a true conclusion

=== Indirect Proof
// TODO: Re-write this section, this is ugly and verbose and bad.
Proofs of an equivalent implication. For example, the contrapositive of a statement can be used to prove that statement.
- Proof by Contradiction
Assume a counterexample can be found. Then there is an element in the domain that either:
  - Makes the hypothesis true #h(34pt) Makes the conclusion false
This leads to a contradiction.

== Subtypes of Proof (?)
=== Element-wise Proofs
Show that for _any_ arbitrary element inside a set, some relation holds.
- $A subset.eq B$: $forall x in A, x in B$ 
- $A = B$: $A subset.eq B and B subset.eq A$

== Proof Tips
- Use the definitions to express things that reveal fundamental properties
- Use variables that represent *any* element in the domain
- Do not use the same variable for two different things
- Apply rules/properties that apply to every element in the domain
- The resulting conclusions should be true for any element in the domain.

=== Set-Builder Notation
$S = { "domain" | "predicate"}$
- ${x in NN : x "is even"}$
- ${x in NN : x mod 2 = 0}$

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

== Counting
#image("counting.png", width: 85%, )

- #underline[_Rule of Products_]: If there are $n$ ways to do task $A$ and $m$ ways to do task $B$ regardless of how $A$ was performed, then there are $m dot n$ ways to do $A B$.
- #underline[_Rule of Sums_]: If there are $n$ ways to do task $A$ and $m$ ways to do task $B$, then there are $m + n$ ways to do task $A$ or $B$ but not both.
- #underline[_Choose_]: $binom(n, r) = n!/(r!(n-r)!)$ #h(34pt) #underline[_Permute_]: $P(n, r) = n!/(n-r)!$ 










== Example Problem
=== $sqrt(2) in.not QQ$ - by contradiction.
- Suppose not. That is, $exists p, q in ZZ != 0 "s.t." sqrt(2) = p/q, "s.t."$ (1) $p, q$ do not share a factor.
- Then $2 = p^2/q^2 => 2q^2 = p^2$.
- By definition of even, $p^2$ is even.
- This implies $p$ is even. (proof omitted)
- Then, $p = 2a, a in ZZ => 2 = (4a^2)/q^2 => q^2 = 2a^2$.
- By definition of even, $q^2$ is even.
- This implies $q$ is even.
- Since both are even, they both have a common factor $2$.
- This contradicts (1): $p, q$ do not share a factor. $qed$

=== There are infinitely many prime numbers - by contradiction.
- Fact (1): Any integer $n > 1$ is divisible by some prime number.
- Fact (2): For any integer, $a$, and any prime number, $p$, if $p divides a => p divides.not a + 1$
- Assume there is a finite number of prime numbers. Then, let $p$ be the largest prime number.
- Then, we can write all the prime numbers in ascending order as such: $2, 3, 5, 7, 11, ..., p$.
- Let another integer, $n = (2 * 3 * 5 * 7 * ... * p) + 1$.
- We know by (2) that since $n$ is divisible by every prime number, $n + 1$ is divisible by no prime number.
- But by (1), $n + 1$ must be divisible by some prime number.
- This contradicts our assumption that $p$ is the largest prime number. Therefore, there are infinitely many prime numbers. $qed$

=== How many ways to rearrange the letters in the word "MISSISSIPPI":
- $11$ letters means $11!$ permutations, but this is an overcount
- Each set of identical letters is overcounted, so divide by those permutations:
- $11!/(4! dot 4! dot 2! dot 1!)$

=== How many sequences $(x, y, z)$ of non-negative integers satisfy $x + y + z = 10$?
- The solution is a sequence of three numbers in $ZZ^(>= 0)$ that add up to 10. Note:
	- Order matters, because it is a sequence
	- Repeats are allowed
	- This is not an unordered list structure
- How many binary sequences of length $12$ have exactly two $1$'s and ten $0$'s?
- Precisely equal to the desired answer.
- The number of binary sequences of length $r + n - 1$ containing exactly $r space 0$'s is $binom(r + n - 1, r)$.

=== How many outcomes frrom four throws of a six-sided die sum to 14?
1. Count solutions where all $x_i >= 1$.
2. Count solutions where some $x_j >= 7$.
3. Required answer is (1) - (2).

$x_1 + x_2 + x_3 + x_4 = 14$.

1: 
- The minimum number that appears on a die is 1, so 4 out of 14 is already guaranteed.
- The same as counting solutions where $y_i >= 0$ for the equation $y_1 + y_2 + y_3 + y_4 = 10$.
- We know that the number of solutions with $y_i >= 0$ is $binom(10 + 4 - 1, 10) = 286$.

2: Count solutions where at least one $x_j >= 7$ for $x_1 + x_2 + x_3 + x_4 = 14$.
- Equivalent to "How many bags of 14 pieces of fruit can be bought from a store that sells apples, bananas, oranges, and pears, if we get at least 7 of one kind and one of each other kind?"
- One way to pick 7 apples, 1 banana, 1 orange, and 1 pear.
	- How many ways to pick the remaining 4 pieces of fruit to fill the bag?
	- Equivalent to $z_1 + z_2 + z_3 + z_4 = 4$.
	- $binom(4 + 4 - 1, 4)$.
- One way to pick 1 apple, 7 bananas, 1 orange, and 1 pear.
- So on, and so forth...
- Resulting quantity is $binom(4 + 4 - 1, 4) dot 4$.

3: Required answer is (1) - (2).

// This proof is long and I don't like it. Probably remove this.
=== $(A inter B) union (A inter C) = A inter (B union C)$ - element-wise.
By definition of set equality, we must prove two things:
1. $(A inter B) union (A inter C) subset.eq A inter (B union C)$
2. $A inter (B union C) subset.eq (A inter B) union (A inter C)$

  For 1: Let $x in (A inter B) union (A inter C)$. By definition of $union$, we consider two possible cases:
  1. $x in A inter B$
    - By definition of $inter$, $x in A and x in B$.
    - By definition of $union$, $x in B => x in B union C$.
    - By definition of $inter$, since $x in A and x in B union C, x in A inter (B union C)$.
  2. $x in A inter C$.
    - By definition of $inter$, $x in A and x in C$.
    - By definition of $union$, $x in C => x in B union C$.
    - By definition of $inter$, since $x in A and x in B union C, x in A inter (B union C)$.
  Therefore, $x in (A inter B) union (A inter C) subset.eq A inter (B union C). qed$

  For 2: Let $x in A inter (B union C)$. By definition of $inter$, we know $x in A and x in (B union C).$ By definition of $union$, we consider two possible cases:
  1. $x in A and x in B$.
    - By definition of $inter$, $x in A inter B$.
    - By definition of $union$, $x in (A inter B) union (A inter C)$.
  2. $x in A and x in C$.
    - By definition of $inter$, $x in A inter C$.
    - By definition of $union$, $x in (A inter B) union (A inter C)$.
  Therefore, $x in A inter (B union C) subset.eq (A inter B) union (A inter C). qed$

Since we have proved (1) and (2), $(A inter B) union (A inter C) = A inter (B union C). qed$