pragma solidity ^0.4.15;
// Proof of Existence contract, version 2
contract ProofOfExistence2 {
  // state
  mapping (bytes32 => bool) private proofs;
  // store a proof of existence in the contract state
  // *transactional function*
  function storeProof(bytes32 proof) {
    proofs[proof] = true;
  }
// calculate and store the proof for a document
  // *transactional function*
  function notarize(string document) {
    bytes32 proof = proofFor(document);
    storeProof(proof);
  }
// helper function to get a document's sha256
  // *read-only function*
  function proofFor(string document) pure returns (bytes32) {
    return sha256(document);
  }
// check if a document has been notarized
  // *read-only function*
  function checkDocument(string document) constant returns (bool) {
    bytes32 proof = proofFor(document);
    return hasProof(proof);
  }
  // returns true if proof is stored
  // *read-only function*
  function hasProof(bytes32 proof) constant returns (bool) {
    return proofs[proof];
  }
}
