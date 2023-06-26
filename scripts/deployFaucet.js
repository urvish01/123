const hre = require("hardhat");


async function main(){
    const Faucet = await hre.ethers.getContractFactory("Faucet");
    const faucet = await Faucet.deploy("0x962154a4a93880e577A251bdb9bE68652B616f94");// constructor data

    await faucet.deployed();
    console.log("address of Faucet is : ", faucet.address); //0x6ea12BbeaD3E84d00428fd600E85Da545C836979

}

main().then(()=> process.exit(0)).catch((error)=>{
    console.error(error);
    process.exit(1);
});