/*
	File: fn_switchCamera.sqf
	Author: [midgetgrimm]
	Purpose: keeps player in 1st person unless driving or building, 
			 plus gives a 3 second check camera if not in combat to view gear and what not..
			 If in Combat, straight to 1st person
			 Also script wont run if you set it to hardcore, this is so you can keep group settings and some leniency
	TODO: ;;;
*/
if (difficultyEnabled "3rdPersonView") then {
	while {true} do {
		waitUntil {cameraView == "EXTERNAL" || cameraView == "GROUP"};
		sleep 0.1;
		if  ((vehicle player) == player) then {
				if(ExileClientPlayerIsInCombat) then {
					player switchCamera "INTERNAL";
				} else {
					if(!(ExileClientIsInConstructionMode)) then {
						sleep 3;
						player switchCamera "INTERNAL";
					};
				};
		}; 
		if (((vehicle player) != player) && (ExileClientPlayerIsInCombat)) then {
			(vehicle player) switchCamera "Internal";
		};
		sleep 0.1;
	};
};