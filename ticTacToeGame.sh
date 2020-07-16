#!/bin/bash 

echo ">>>>>>>>>>>>>>>>>>>> TIC TAC TOE <<<<<<<<<<<<<<<<<<"

#CONSTANTS
BOARD_BOX=9;
DISTANCE=" ";


#assign variables
declare -a designBoard

#Start with resetting the board
function resetPlayerBoard() {
	for ((boardCellsRow=1;boardCellsRow<=3;boardCellsRow++))
	do
		for ((boardCellsColumn=1;boardCellsColumn<=3;boardCellsColumn++))
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
		echo "Please choose game sign to play"
		echo "Press 1 for X"
		echo "Press 2 for O"
		read symbolSelection
		playerChanceChoose
	else
		echo "Robot wins, and choose the game sign"
		computerChanceChoose
	fi 
	
	#Display the symbols of game
}

function displayBoardBox() {
	for ((boardCellsRow=1;boardCellsRow<=3;boardCellsRow++))
	do
		for ((boardCellsColumn=1;boardCellsColumn<=3;boardCellsColumn++))
		do
			echo " ${designBoard[$boardCellsRow,$boardCellsColumn]} "
			columnDesign
		done
		rowDesign
	done
}

function columnDesign() {
	if [[ $boardCellsColumn -ne 3 ]]
	then
		echo " | "
	fi
}

function rowDesign() {
	if [[ $boardCellsRow -ne 3 ]]
	then
		echo " __ "
	fi
}

function playerChanceChoose() {
	if [[ $symbolSelection -eq 1 ]]
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
selectionForLXandLO
displayBoardBox

echo "Player gets $playerGameIcon"
echo "Computer gets $computerGameIcon"

#End of Use Case 02
