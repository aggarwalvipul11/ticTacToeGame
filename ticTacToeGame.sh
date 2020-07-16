#!/bin/bash

echo ">>>>>>>>>>>>>>>>>>>> TIC TAC TOE <<<<<<<<<<<<<<<<<<"

#CONSTANTS
BOARD_BOX=9;
DISTANCE=" "

#assign variables
declare -a designBoard

#Start with resetting the board
function resetPlayerBoard() {
	for ((boardCellsRow=1;boardCellsRow<=$BOARD_BOX;boardCellsRow++))
	do
		for ((boardCellsColumn=1;boardCellsColumn<=$BOARD_BOX;boardCellsColumn++))
		do
			designBoard[$boardCellsRow,$boardCellsColumn]=$DISTANCE
		done
	done
}

#Player would begins with toss check who plays first
function playerToss() {
	if [[ $((RANDOM%2)) -eq 1 ]]
	then
		echo "Player wins toss, start the game."
	else
		echo "Computer wins toss, start the game."
	fi
}

resetPlayerBoard
playerToss
#End of Use Case 02
