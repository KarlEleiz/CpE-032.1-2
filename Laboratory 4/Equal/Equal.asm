MAIN  SEGMENT
      ASSUME CS:MAIN,DS:MAIN,ES:MAIN,SS:MAIN

      ORG 100h

START:
  MOV DL, 41h
  MOV DH, 41h
  CMP DH, DL
  JE  TheyAreTheSame
  JMP TheyAreNotSame


TheyAreNotSame:
  MOV AH, 02h
  MOV DL, 4Eh
  INT 21h
  INT 20h

TheyAreTheSame:
  MOV AH,02h
  MOV DL,59h
  INT 21h
  INT 20h

	MAIN ENDS
END START

