// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Lottery{
    address public manager;
    address[] public players;
    constructor(){
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > .01 ether );
        players.push(msg.sender);
    }

    function random() private  view returns (uint){
        return uint (keccak256 (abi.encodePacked(block.difficulty,block.timestamp,players)));
    }

    // function pickWinner() public {
    //     uint index = random() % players.length;
    //     players[index].transfer(this.balance);
    // }
    function pickWinner() public {
    uint index = random() % players.length;
    address payable winner = payable(players[index]); // Convert the winner's address to payable
    winner.transfer(address(this).balance); // Use address(this).balance to access contract balance
}

}

// more to be added .....