#!/bin/bash

echo ">>>>>>>>>>>>>>>>>>>> TIC TAC TOE <<<<<<<<<<<<<<<<<<"

#CONSTANTS
BOARD_BOX=9;
DISTANCE=" "

#assign variables
declare -a designBoard

function resetPlayerBoard() {
	for ((boardCellsRow=1;boardCellsRow<=$BOARD_BOX;boardCellsRow++))
	do
		for ((boardCellsColumn=1;boardCellsColumn<=$BOARD_BOX;boardCellsColumn++))
		do
			designBoard[$boardCellsRow,$boardCellsColumn]=$DISTANCE
		done
	done
}

resetPlayerBoard
#End of Use Case 01
