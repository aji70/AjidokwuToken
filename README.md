# CREATING AN ERC 20 TOKEN

### Line 1

specifying the license identifier setting it to MIT
A license identifier is a unique code or name that identifies the type of license under which a software program or other digital asset is distributed.

### Line 2

Pragma is use to specify the version of solidity we are using in this case we are using 0.8.17

### Line 4 - 65

we always write our contracts between a code block that starts with the keyword contract followed by the contract name, it is always conventional that the contract have the same name as the file it is saved in.

### Line 5 & Line 8

we declear a private uint the totalSupply in line 5 to hold the total amount of our tokens but is yet to be initialized hence the value is set to zero.
Line 8 is also a uint and it holds how many decimals our token have and in this case 18.

### Line 6 & 7

Line 6 and 7 are mappings.
mappings are data type that acts as a tracker where keys are used to track values easily.
balances in line 6 takes the key which is a unique (an address) and maps it to a uint. this mapping would be used to track balances of addresses.
Line 7 is a tad complicated as it is a mapping of an address to another mapping here it would be used to track allowance which is the amount a user approves for another user to spend on his behalf.

### Line 8 & 9

they are both the declearation of public strings, strings are a collection of characters, line 8 hold the name of the token and line 9 holds the symbol.

### line 12 & 13

events are used to communicate changes in the state of a block chain, and we decleared to one to alert a user of succcessful transfer and the other approval.

### line 16 - 22 Constructor

the constructor is a function that runs only at deployment and we used it to assign value to our state variables in this case

### line 25 - 35 Transfer

Line 25 to 34 is a function block that is run when transfer is call the code within the {} makes it possible for users to transfer their tokens.
Line 25 is also know as the function signature without the '{'. it takes 2 arguements in the () an address recepient who the funds would be sent to, and a uint which is the amount to be sent, it is an external function which means it can only be interacted with from outside the contarct and it returns a boolean value which is 'true' which in this case is used to signify a successful transcation.
line 26 runs a check that the recepient address is not a null address in this case address zero.
line 27 is a comutation that takes a uint with the name charge, and the computation to store 10% of the amount to be transfered is stored in it.
line 28 checks and confirms if the user has enough funds plus charges to make the transfer.
line 29 burns the charges ie take it out of circulation.
line 30 deduct the amount to be transferred from the balance of the person calling the function and this balance is added to the balance of the recipiant in line 30. the calculated charge is also deducted from the senders balance in line 31 and is burnt by passing it into the function call of the burn funciton in line 29. the transfer event is emmited in line 33 and finally the status of the transfer is returned in line 34.

### Line 37 - 44 Approve function

This function approves a certain amount for users to give other users to be able to spend from their account.
line 37 is the function signature having 2 arguements which is the address of the intended spended and the amount to be released to him. it is an external function that returns a boolean.
Line 38 make sures the intended spender is not a zero address abd line 39 calculates the charges to be burnt as the transfer fee while line 40 ensures the user can afford the allowance he intends to release to the spender plus the charge
in line 41, it takes the amount from the balance of the owner and assigns it to the spender to be able to spend from his balance. An event is triggered for this action in line 42 and line 43 returns the status of the function.

### Line 46 -61 transferFrom

this function takes 3 arguements between line 47 and 49, the senders address, receipient address, and the amount to be sent, it is an external function and returns a boolean if the action is successful.
line 51 calculate the charge and ensures the user can afford the transcation in line 52. Line 53 checks if the aamount the spender intends to spend is not more than the amount approved for him to spend line 54 deducts the allowance from the spender and line 55 subtract the charges from the senders balance, line 56 deducts it from the user balance line 57 burns the charges while line 58 adds the transfered token to the the recipient balance an event is triggered in line 59 and the status of the function is returned in line 60.

### Line 63 - 67 Mint

minting is the creation of a new token, it allows the owner to create new tokens and adds to the totalsupply and users balance.
it takes the amount of tokens to be created in the arguement.
Line 64 requires the person calling the mint function is the owner of the contract, line 65 adds the new tokens to the balance of the owner line 66 reflect this in the total supply and line 67 emit an event.

### Line 70 - 75 burn

burning of a token is destroying the token amount and removing it from circulation, it takes in just a parameter which is the amount of tokens the user intends to burn
line 71 ensures the user is not trying to burn zero tokens, line 72 ensures the user has atleast the amount of tokens he intends to burn, line 73 destroys the token from the from the users account line 74 reflects it in the total supply and line 75 emits the event.
