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
