// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    mapping(string => uint256) public votes;
    mapping(string => bool) private exists;
    string[] public candidates;

    function vote(string memory candidate) public {
        if (!exists[candidate]) {
            candidates.push(candidate);
            exists[candidate] = true;
        }
        votes[candidate] += 1;
    }

    function getVotes(string memory candidate) public view returns (uint256) {
        return votes[candidate];
    }

    function resetVotes() public {
        for (uint256 i = 0; i < candidates.length; i++) {
            votes[candidates[i]] = 0;
        }
    }
}
