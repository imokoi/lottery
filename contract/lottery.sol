pragma solidity ^0.6.0;

contract Lottery {
    address public manager;
    address payable public winner;
    address payable [] public players;

    uint256 public round = 1;

    constructor() public {
        manager = msg.sender;
    }

    function play() public payable {
        require(msg.value == 1 ether);
        players.push(msg.sender);
    }

    modifier onlyOwner {
        require(manager == msg.sender);
        _;
    }

    function draw() public onlyOwner {
        require(players.length != 0);
        uint256 index = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % players.length;
        winner = players[index];
        winner.transfer(address(this).balance);
        round += 1;
        delete players;
    }

    function drawback() public onlyOwner {
        require(players.length != 0);
        for (uint i=0; i<players.length; i++) {
            players[i].transfer(1 ether);
        }
        round += 1;
        delete players;
    }

    function getPlayers() public view returns(address payable [] memory) {
        return players;
    }

    function getAmount() public view returns(uint256) {
        return address(this).balance;
    }

    function getManager() public view returns(address) {
        return manager;
    }

    function getRount() public view returns(uint256) {
        return round;
    }

    function getWinner() public view returns(address) {
        return winner;
    }

    function getPlayerCount() public view returns(uint256) {
        return players.length;
    }
}
