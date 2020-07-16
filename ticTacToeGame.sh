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
	tossCheck=$((RANDOM%2))
	if [[ $tossCheck -eq 1 ]]
	then
		echo "Player wins toss, start the game."
	else
		echo "Robot wins toss, start the game."
	fi
}

function selectionForLXandLO() {
	playerToss
	if [[ $tossCheck -eq 1 ]]
	then
		echo "Please choose game X OR game O"
		read symbolSelection
		playerChanceChoose
	else
		echo "Robot wins, and choose the game sign"
		computerChanceChoose
	fi 
	
	#Display the symbols of game
	echo "Player gets $playerGameIcon"
	echo "Computer gets $computerGameIcon"
}

function playerChanceChoose() {
	if [[ $symbolSelection -eq 'X' ]]
	then
		playerGameIcon=X;
		computerGameIcon=O;
	else
		playerGameIcon=O;
		computerGameIcon=X;
	fi
}

function computerChanceChoose() {
	if [[ $((RANDOM%2)) -eq 1 ]]
	then
		computerGameIcon=X;
		playerGameIcon=O;
	else
		computerGameIcon=O;
		playerGameIcon=X;
	fi
}

resetPlayerBoard
playerToss
selectionForLXandLO
#End of Use Case 02
