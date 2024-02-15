#### CREATING AN ERC 20 TOKEN

## Line 1

specifying the license identifier setting it to MIT
A license identifier is a unique code or name that identifies the type of license under which a software program or other digital asset is distributed.

# Line 2

Pragma is use to specify the version of solidity we are using in this case we are using 0.8.17

# Line 4 - 65

we always write our contracts between a code block that starts with the keyword contract followed by the contract name, it is always conventional that the contract have the same name as the file it is saved in.

# Line 5 & Line 8

we declear a private uint the totalSupply in line 5 to hold the total amount of our tokens but is yet to be initialized hence the value is set to zero.
Line 8 is also a uint and it holds how many decimals our token have and in this case 18.

# Line 6 & 7

Line 6 and 7 are mappings.
mappings are data type that acts as a tracker where keys are used to track values easily.
balances in line 6 takes the key which is a unique (an address) and maps it to a uint. this mapping would be used to track balances of addresses.
Line 7 is a tad complicated as it is a mapping of an address to another mapping here it would be used to track allowance which is the amount a user approves for another user to spend on his behalf.

# Line 8 & 9

they are both the declearation of public strings, strings are a collection of characters, line 8 hold the name of the token and line 9 holds the symbol.

# line 7

sets the address that deploys the contract as the owner of the contract

# line 12 & 13

events are used to communicate changes in the state of a block chain, and we decleared to one to alert a user of succcessful transfer and the other approval.

# line 15 - 25 Transfer

Line 15 to 24 is a function block that is run when transfer is call the code within the {} makes it possible for users to transfer their tokens.
Line 15 is also know as the function signature without the '{'. it takes 2 arguements in the () an address recepient who the funds would be sent to, and a uint which is the amount to be sent, it is an external function which means it can only be interacted with from outside the contarct and it returns a boolean value which is 'true' which in this case is used to signify a successful transcation.
line 16 runs a check that the recepient address is not a null address in this case address zero.
line 17 is a comutation that takes a uint with the name charge, and the computation to store 10% of the amount to be transfered is stored in it.
line 18 checks and confirms if the user has enough funds plus charges to make the transfer.
line 19 burns the charges ie take it out of circulation.
line 20 deduct the amount to be transferred from the balance of the person calling the function and this balance is added to the balance of the recipiant in line 20. the calculated charge is also deducted from the senders balance in line 21 and is burnt by passing it into the function call of the burn funciton in line 19. the transfer event is emmited in line 23 and finally the status of the transfer is returned in line 24.

# Line 27 - 32 Approve function

This function approves a certain amount for users to give other users to be able to spend from their account.
line 25 is the function signature having 2 arguements which is the address of the intended spended and the amount to be released to him. it is an external function that returns a boolean.
in line 26, it takes the amount from the balance of the owner and assigns it to the spender to be able to spend from his balance. An event is triggered for this action in line 27.

# Line 31 - 41 transferFrom

this function takes 3 arguements, the senders and receipient address, and the amount to be sent, it is an external function and returns a boolean if the action is successful.

# Line 43 - 47 Mint

minting is the creation of a new token, it allows users create new tokens.
it takes the amount of tokens to be created in the arguement,
