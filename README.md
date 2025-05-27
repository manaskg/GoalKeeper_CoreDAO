<h1 align="center">🥅 GoalKeeper</h1>

<p align="center">
  <b>A gamified, smart contract-based savings challenge to help you stick to your habits.</b><br>
  <i>"Discipline is remembering what you want." - GoalKeeper remembers for you — in code."</i>
</p>

---

## 📌 What is GoalKeeper?

**GoalKeeper** is a decentralized, autonomous savings accountability tool built on smart contracts. Users commit to a habit or goal and lock up funds as a stake. If they meet their target within the deadline, they can reclaim their money. If not, the funds are forfeited, providing a real-world consequence to reinforce positive habits.

---

## 🔧 How It Works

1. **Set a Goal** – Define a habit or target (e.g., daily jog, meditation, coding streak).
2. **Stake Funds** – Lock up a small amount of crypto as a commitment.
3. **Deadline Starts** – A timer begins for you to achieve your goal.
4. **Proof of Completion** – Call a success function when you hit the goal.
5. **Outcome**  
   - ✅ Success: You get your staked funds back.  
   - ❌ Failure: Funds are forfeited (burnt or sent to a beneficiary).

---

## 💡 Use Cases

- Fitness challenges
- Study streaks
- No-junk-food goals
- Writing or productivity sprints
- Habit tracking with financial accountability

---

## ⚙️ Smart Contract Overview

```solidity
// Pseudocode structure
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
        require(block.timestamp >= deadline, "Deadline not reached");
        if (goalMet) {
            payable(owner).transfer(goalAmount);
        } else {
            // Funds can be burned or sent to another address
        }
    }
}
```

---

🛠️ Tech Stack
Layer	Technology
Blockchain	Core Blockchain (Testnet)
Smart Contract	Solidity
Deployment	Remix + MetaMask
Explorer	BTCS Scan (Testnet)

---

📦 Contract Deployment Details
Field	Value
Transaction Hash	0x95157d...ea026
Contract Address	0x95c7e10a0627181df5e77e5290ba8f9e9f619ab3
Network	Core Testnet
Deployment Date	May 26, 2025
Gas Fee	~0.01 tCORE2

---

🖼️ Screenshot of Transaction

![Screenshot 2025-05-26 141454](https://github.com/user-attachments/assets/b72c15da-fd6d-4228-badc-7960b286e617)

---

🧱 Roadmap & Features (Planned)
 Stake-based goal commitment system

 Success/failure tracking

 Add beneficiary for forfeited funds

 Habit logging through front-end interface

 NFT badges or rewards

 Daily streak tracking and leaderboard

 Social challenge creation (peer group goals)

 ---

🛡️ License
This project is licensed under the MIT License — free to use, build upon, and improve.
