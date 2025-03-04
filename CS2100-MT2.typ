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
=== Partitions
For a set $A$ to be a partition of $B$, the following must be true of $A$:
1. The sets contained in $A$ must be mutually disjoint.
2. The union of the sets contained in $A$ must be $B$.
3. Every set in $A$ must $!= diameter$

=== Relations
For all definitions, consider a relation $R$ on a set $S$.
1. _Transitivity_: $R$ is transitive $<=>$ $(a, b) in S, (b, c) in S => (a, c) in S$.
2. 
  _Reflexivity_: $R$ is reflexive $<=>$ $forall a in S, (a, a) in R$. 
  #linebreak()
  _Irreflexivity_: $R$ is irreflexive $<=>$ $forall a in S, (a, a) in.not R$.
3. 
  _Symmetry_: $R$ is symmetric $<=>$ $(a, b) in R => (b, a) in R$.
  #linebreak()
  _Antisymmetry_: $R$ is antisymmetric $<=>$ $(a, b) and (b, a) in R => a = b$.


=== Ordering
- _Partial Ordering_: A relation $R$ on $S$ is a partial order if it is reflexive, antisymmetric, and transitive.
  - Relations with partial orders may be drawn using a Hasse diagram.
- _Total Ordering_: A relation $R$ on $S$ is a total order if it is a partial order and $forall a, b in S, (a, b) in R.$

=== Graphs
Connectedness (both strong & weak)

== Useful Properties
1. Closure

== Procedures
=== Proof Structure
- Direct
- Contrapositive
- Contradiction
- Element-wise Proofs
- Logical Equivalence proofs
- Set equality: The formal definition requires you to show $A subset.eq B and B subset.eq A$.
- What about function proofs? Get a couple examples of these on the sheet.

== Other
- How to write the definitions of injective, surjective, bijective
- Remainder theorem?
- What other theorems??
- Maximum amount of edges on a graph
- Are graphs on this exam, actually?