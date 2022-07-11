# Merkle Trees

Binary trees to encode large quantities of information. They allow a verifier to confirm if a value is present in the tree without disclosing every element in a tree. It is a has tree where each leaf is labeled with the hash of a data block.
Each non-leaf node has two children. Parents will have the has of the combined hashed of leaf nodes.
The merkle tree root is the top-level node of all the hashes.
Changing a transaction in a merkle tree will change the parent hashes and the fradulent transaction can be identified.
