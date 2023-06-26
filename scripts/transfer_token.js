//const API_KEY = process.env.API_KEY;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const CONTRACT_ADDRESS = '0x5F2f9b09F823d58ACd4e7571DE8bf59d49B7ED5e';

const contract = [
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "fooAddress",
            "type": "address"
          }
        ],
        "stateMutability": "nonpayable",
        "type": "constructor"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "",
            "type": "address"
          }
        ],
        "name": "lockTime",
        "outputs": [
          {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [],
        "name": "urvish",
        "outputs": [
          {
            "internalType": "address",
            "name": "",
            "type": "address"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "to",
            "type": "address"
          },
          {
            "internalType": "uint256",
            "name": "amt",
            "type": "uint256"
          }
        ],
        "name": "withdraw",
        "outputs": [
          {
            "internalType": "bool",
            "name": "",
            "type": "bool"
          }
        ],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "",
            "type": "address"
          }
        ],
        "name": "withdrawals_balance",
        "outputs": [
          {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      }
    ];
  

// provider - Alchemy
const infruProvider = new ethers.getDefaultProvider('https://goerli.infura.io/v3/92eedcf520ab41ac98010111f5bebd82');
//new ethers.getDefaultProvider

// signer - you
const signer = new ethers.Wallet(PRIVATE_KEY, infruProvider);

// contract instance
const fauset = new ethers.Contract(CONTRACT_ADDRESS, contract.abi, signer);

async function main() {
    const message = await fauset.withdraw(0x37FcE78B5C5251c898624AFf0B994490094548Df,'100');
    console.log("The message is: " + message);

    // console.log("Updating the message...");
    // const tx = await fauset.update("this is the new message");
    // await tx.wait();

    // const newMessage = await fauset.message();
    // console.log("The new message is: " + newMessage);
}

main();