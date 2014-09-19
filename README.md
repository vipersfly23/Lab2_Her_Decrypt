Lab2_Her_Decrypt
================

The purpose of this lab is to write a program that will decrypt an encrypted message and store it into memory.

###Objective and Purpose
The objective of this lab is to write a program that will decrypt an ecrypted message using XOR method. The academic purpose of this lab is to learn to use sub-routines to help implement the program and fully understand the concept of push/pop of registers to ensure registers are safe from subroutines.

Required Functionality [COMPLETED]:
  
   Write two subroutine:
    
    decryptMessage: should take in an encrypted message and output the decrypted message
    
    decryptCharacter: Decrypts the byte and returns it.
  
  Use a given key, and decrypt a given message.

  
B-Functionality [COMPLETED]
  
    The program must decrypt and arbitrarily long key. 
  
###Implementation  

  Please Reference Pre-Lab assignment. (Turned into instructor)

###Code

Register Definition:

  * R4 - length of the key
  * R5 - counter to compare to the length of the key
  * R6 - counter to be compared to the string length
  * R9 - stores the encrypted character
  * R10 - Points to the encrypted message
  * R12 - holds the decrypted character
  * R13 - Points to key
  * R14 - Points to where to store the Decrypted message
  * R15 - Length of the encrypted message

#####Main:

![alt text](https://raw.githubusercontent.com/vipersfly23/Lab2_Her_Decrypt/3fd31b067e91324bc0ba4489e32ce79b90e03e66/Main.GIF "Main Code")

The point of the main is established and defines the registers as stated in the register definition. The main also calls the subroutine.

#####B-Functionality

![alt text](https://raw.githubusercontent.com/vipersfly23/Lab2_Her_Decrypt/master/dMessage.GIF "decryptMessage")
![alt text](https://raw.githubusercontent.com/vipersfly23/Lab2_Her_Decrypt/master/dChar.GIF "decryptCharacter")
This program not only meets the required functionality, but also meets the requirement of the B-functionality. This program takes in a N-byte long encrypted message, and a N-byte long key and decrypts the encrypted message using the given key by the method of XOR.

The decryptMessage subroutine takes in an encrypted message and a key. The length of both the encrypted message and key is know. It then calls the subroutine decryptCharacter which decrypts the encrypted message applying XOR of encrypted message and key one at a time. The output is stored into RAM in decryptMessage and the program continues to cycle through until the message is fully decrypt.


###Debugging/Testing

#####Methodology
  Below is a picture of flow chart in which I will base my coding on. Though it wasn't correct in how I used the subroutine, it
  served as a basis to my coding, and led me to my final project: **More included with pre-lab**
  
  Preliminary Design:
  ![alt text](https://raw.githubusercontent.com/vipersfly23/Lab2_Her_Decrypt/master/FlowChart.gif "Flow Chart")
  
    My methodology was dividing and conquered. I knew the method was to XOR the bytes in the key with the encrypted message. I
    instantly knew there had to be a pointer to the message and one for the key. Building on that concept, lead me to the
    solution. Understanding the subroutine was the next hardest concept, hence the subroutine was not properly used until later
    commits.
   
    My biggest issue was learning to proper use the subroutine. From previous experiences, I instantly did everything in Main.
    After conceptualizing the purpose of a subroutine, it was simple to move the code from main into the subroutines. This was
    simple because the code was already functioning, thus all that was required was safeguarding the registers in the
    subroutines and re-implementing the codes in the subroutines.
      

#####Commit 1

   Not much was done; it was mainly to get a feel for the code.
  
#####Commit 2
  
   Worked from pseudo codes and started to write more code, nothing tested yet.
   
#####Commit 3
    
    Completed B functionality for the program. Test pass the required functionality, and decrypted the message to provide a
    
    hint for the A-functionality.

#####Commit 4
  
    Re-arranged the code to property use the subroutines. Before main was doing most of the work.

#####Commit 5

    Fixed the registers to instructor’s preferences. No major changes
    
****All other commits are either to add comments to the program or to update the README file****

#####Testing:

B Functionality Test Case:

   Encrypted Message: 0xf8,0xb7,0x46,0x8c,0xb2,0x46,0xdf,0xac,0x42,0xcb,0xba,0x03,0xc7,0xba,0x5a,0x8c,0xb3,0x46,0xc2,0xb8,0x57
   0xc4,0xff,0x4a,0xdf,0xff,0x12,0x9a,0xff,0x41,0xc5,0xab,0x50,0x82,0xff,0x03,0xe5,0xab,0x03,0xc3,0xb1,0x4f,0xd5,0xff,0x40,0xc3
   0xb1,0x57,0xcd,0xb6,0x4d,0xdf,0xff,0x4f,0xc9,0xab,0x57,0xc9,0xad,0x50,0x80,0xff,0x53,0xc9,0xad,0x4a,0xc3,0xbb,0x50,0x80,0xff
   0x42,0xc2,0xbb,0x03,0xdf,0xaf,0x42,0xcf,0xba,0x50,0x8f

Key:
    0xacdf23

My Result:
**PASS**
![alt text](https://raw.githubusercontent.com/vipersfly23/Lab2_Her_Decrypt/master/bFunction.GIF "Test Results")


###Conclusions/Lessons Learned

In conclusion, the decrypting program using the method of XOR was a success. A-functionality was not met due to time constraints but the B-functionality tested and was successful. Establishing the pointer to the key and the encrypted message was the key to producing this program. 

The biggest lesson learned from this lab is to ensure full understanding of the subroutine before implementing the program. Though the programming was simple, by not fully understanding the subroutine, I spent more time than actually necessary to correctly implement the required functionality and the B-functionality of this lab.


####Documentation:
  I used the ECE382.com website to access lab information and used the website to obtain the instruction sheet for the assembly
  language. No other help received.
