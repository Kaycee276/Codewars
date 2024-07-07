// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.0;

contract RockPaperScissors {
  enum Move {None, Rock, Paper, Scissors}
  
  struct Game {
    address payable creator;
    address payable participant;
    uint bet;
    Move creatorMove;
    Move participantMove;
    bool isActive;
  }

  mapping(uint => Game) public games;
  uint public gameCounter;

  event GameCreated(address creator, uint gameNumber, uint bet);
  event GameStarted(address[] players, uint gameNumber);
  event GameComplete(address winner, uint gameNumber);
  
  /**
   * Use this endpoint to create a game. 
   * It is a payable endpoint meaning the creator of the game will send ether directly to it.
   * The ether sent to the contract should be used as the bet for the game.
   * @param participant - The address of the participant allowed to join the game.
  */
  function createGame(address payable participant) public payable {
    require(msg.value > 0, "You have to deposit some ETH");

    gameCounter++;
    games[gameCounter] = Game({
      creator : payable(msg.sender),
      participant: participant,
      bet: msg.value,
      creatorMove: Move.None,
      participantMove: Move.None,
      isActive: true
    });

    emit GameCreated(msg.sender, gameCounter, msg.value);
  }
  
 /**
  * Use this endpoint to join a game.
  * It is a payable endpoint meaning the joining participant will send ether directly to it.
  * The ether sent to the contract should be used as the bet for the game. 
  * Any additional ether that exceeds the original bet of the creator should be refunded.
  * @param gameNumber - Corresponds to the gameNumber provided by the GameCreated event
*/
  function joinGame(uint gameNumber) public payable {
    Game storage game = games[gameNumber];
    require(game.isActive, "Game does not exist or is already completed");
    require(game.participant == msg.sender, "You to depositing");
    require(msg.value == game.bet, "Bet amount must equal creators bet");

    address[] memory players = new address[](2);
    players[0] = address(game.creator);
    players[1] = address(game.participant);

    emit GameStarted(players, gameNumber);

  }
  
 /**
  * Use this endpoint to make a move during a game 
  * @param gameNumber - Corresponds to the gameNumber provided by the GameCreated event
  * @param moveNumber - The move for this player (1, 2, or 3 for rock, paper, scissors respectively)
 */
  function makeMove(uint gameNumber, uint moveNumber) public { 
    Game storage game = games[gameNumber];
    require(game.isActive, "Game is invalid");
    require(moveNumber >= 1 && moveNumber <= 3, "Invalid move");


    if (msg.sender == game.creator) {
      require(game.creatorMove == Move.None, "Creator has already moved");
      game.creatorMove = Move(moveNumber);
    } else if(msg.sender == game.participant){
      require(game.participantMove == Move.None, "Participant has already moved");
      game.participantMove = Move(moveNumber);
    } else{
      revert("You are not part of the game");
    }

    if(game.creatorMove != Move.None && game.participantMove != Move.None){
      address winner = determineWinner(game.creatorMove, game.participantMove, game);

      if(winner == address(0)){
        game.creator.transfer(game.bet);
        game.participant.transfer(game.bet);
      } else{
        payable(winner).transfer(game.bet * 2);
        
      }

      game.isActive = false;
      emit GameComplete(winner, gameNumber);
    }
  }

  function determineWinner(Move creatorMove, Move participantMove, Game storage game)internal view returns (address){
    if(creatorMove == participantMove){
      return address(0);
    } else if(
      (creatorMove == Move.Rock && participantMove == Move.Scissors) ||
      (creatorMove == Move.Paper && participantMove == Move.Rock) ||
      (creatorMove == Move.Scissors && participantMove == Move.Paper)
    ){
      return game.creator;
    } else{
      return game.participant;
    }
  }
}
