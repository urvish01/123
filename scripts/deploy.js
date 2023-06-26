// const hre = require("hardhat");

// async function main() {
//   const DevToken = await hre.ethers.getContractFactory("DevToken");
//   const devToken = await DevToken.deploy("1000000000000000000000000000");

//   await devToken.deployed();

//   console.log("Token deployed to:", devToken.address);
// }

// main()
//   .then(() => process.exit(0))
//   .catch((error) => {
//     console.error(error);
//     process.exit(1);
//   });

const hre = require("hardhat");

async function main(){
  const Token = await hre.ethers.getContractFactory("Token");  // name of contract file
  const token = await Token.deploy("TokenFromVs","TKN");

  await token.deployed();
  console.log("Token deployed to: ", token.address);   //0x962154a4a93880e577A251bdb9bE68652B616f94
}

main().then(()=> process.exit(0)).catch((error)=>{
    console.error(error);
    process.exit(1);
});