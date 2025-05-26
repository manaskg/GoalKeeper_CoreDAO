# 🥅 GoalKeeper – Gamified Smart Contract for Habit Tracking

**GoalKeeper** is a smart contract that helps users stay committed to their personal goals by staking ETH as a **self-imposed consequence**. If they meet their goal within a specified timeframe, they receive their funds back. If they fail, the funds are **forfeited** to a predefined address (e.g., a friend, DAO, or charity). This project uses blockchain technology to bring transparency, accountability, and gamification to habit-building.

---

## 📌 Features

- ✅ **Goal Commitment** – Users stake ETH along with a description and deadline for their personal goal.
- 🔒 **Trusted Verifier** – A friend, coach, or DAO member can verify if the user completed the goal.
- ⏳ **Deadline Based** – If the deadline is passed and no success is verified, the funds are forfeited.
- 🎯 **Self-Improvement** – Users challenge themselves to grow, with real financial stakes.
- 🛡️ **On-Chain Verification** – All actions are recorded transparently on the blockchain.

---

## 🚀 How It Works

1. **User commits a goal** by sending ETH along with a description, duration, and verifier address.
2. **Verifier** confirms if the goal is completed before the deadline.
3. **If succeeded** → funds returned to the user.
4. **If failed** → funds are transferred to the forfeiture address (e.g., contract owner or a cause).

---

## 🛠 Smart Contract Overview

### Language & Compiler
- Solidity `^0.8.0`
- EVM Compatible (Ethereum, Polygon, etc.)

### Contract Name
`GoalKeeper.sol`

### Core Functions

| Function | Description |
|----------|-------------|
| `commitGoal()` | Stake ETH with a description, verifier, and deadline. |
| `verifySuccess()` | Verifier marks the goal as completed before deadline. |
| `forfeit()` | Anyone can trigger forfeiture after deadline if goal not marked complete. |
| `getMyGoal()` | View your current goal and its status. |

---

## 📄 Sample Usage

### 1. Commit a Goal

```solidity
goalKeeper.commitGoal{ value: 1 ether }(
  "Go to the gym 4 times a week",
  7, // days
  0xVerifierAddress
);

![Screenshot 2025-05-26 141454](https://github.com/user-attachments/assets/8bc80e11-6a16-499c-bd17-37087d965ef3)


