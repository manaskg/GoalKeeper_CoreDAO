# 🥅 GoalKeeper – A Gamified Savings Smart Contract

**GoalKeeper** is a decentralized habit accountability and savings platform that helps users build good habits through financial stakes. If you fail to hit your goal, your staked amount gets forfeited (either to a beneficiary or a burn address). It uses smart contracts to automate commitment, tracking, and consequences.

---

## 🚀 Features

- 💸 Stake crypto to commit to a habit or goal
- ⏰ Set deadline by timestamp
- ✅ Claim funds on success
- ❌ Forfeit funds on failure
- 🧾 Transparent and immutable via blockchain
- 🧪 Deployed on Core Testnet

---

## 🛠️ Technologies Used

- Solidity (Smart Contracts)
- Remix IDE
- Core Blockchain (Testnet)
- MetaMask

---

## 📜 Smart Contract Overview

```solidity
// Sample snippet
contract GoalKeeper {
    address public owner;
    uint public goalAmount;
    uint public deadline;
    bool public goalMet;

    constructor(uint _deadline) payable {
        owner = msg.sender;
        goalAmount = msg.value;
        deadline = block.timestamp + _deadline;
    }

    function confirmGoalMet() public {
        require(msg.sender == owner, "Only owner can confirm");
        goalMet = true;
    }

    function withdraw() public {
        require(block.timestamp >= deadline, "Too early");
        if (goalMet) {
            payable(owner).transfer(goalAmount);
        }
        // Else funds remain locked or can be sent to burn/charity (extension idea)
    }
}
```

✅ Deployment Info (Core Testnet)

Field	Details

Transaction Hash:
0xd76a9a733136f20ac089d9196a76b3ad52dcc160f27d6c3e6dcc4db20c114d23

Status	✅ Success
Block	5015450 (158 Block Confirmations)
Timestamp	2025-05-26 08:32:24 UTC
Deployer Address	0x143af6e807e9de2823eaefe83f2c0b7df1486e50
Contract Address	0xC4AFC1...B5E23a25 (Created)
Value Sent	0.00001 tCORE2
Txn Fee	0.01768209 tCORE2

📷 Screenshot of Deployment
![Screenshot 2025-05-26 141454](https://github.com/user-attachments/assets/394509de-8b0c-4058-8125-f5392dfca52c)


📌 TODOs & Enhancements
Add streak-based bonus system

Community leaderboard

Allow specifying beneficiary (charity or friend) for forfeited funds

UI using React or Flutter frontend

🧠 Inspiration
Behavioral economists suggest that commitment devices help people stick to goals. GoalKeeper implements this using decentralized, tamper-proof smart contracts.

📄 License
This project is licensed under the MIT License.

👨‍💻 Author
Manas
🌐 LinkedIn | 🧠 Passionate about web3, dApps, and social impact tech.
