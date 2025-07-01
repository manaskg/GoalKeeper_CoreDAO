pragma solidity ^0.8.0;

contract GoalKeeper {
    enum Status { Active, Succeeded, Failed }

    struct Goal {
        string description;
        uint256 amount;
        uint256 deadline;
        address verifier;
        Status status;
    }

    address public owner;
    mapping(address => Goal) public goals;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call.");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Start a new goal
    function commitGoal(string memory _description, uint256 _durationInDays, address _verifier) external payable {
        require(msg.value > 0, "Must stake some ETH.");
        require(goals[msg.sender].status == Status(0), "Existing goal in progress.");

        goals[msg.sender] = Goal({
            description: _description,
            amount: msg.value,
            deadline: block.timestamp + (_durationInDays * 1 days),
            verifier: _verifier,
            status: Status.Active
        });
    }

    // Verifier marks goal as succeeded
    function verifySuccess(address _user) external {
        Goal storage goal = goals[_user];
        require(msg.sender == goal.verifier, "Not authorized.");
        require(goal.status == Status.Active, "Goal not active.");
        require(block.timestamp <= goal.deadline, "Deadline passed.");

        goal.status = Status.Succeeded;
        payable(_user).transfer(goal.amount);
    }

    // Anyone can call to forfeit funds after deadline
    function forfeit(address _user) external {
        Goal storage goal = goals[_user];
        require(goal.status == Status.Active, "Goal not active.");
        require(block.timestamp > goal.deadline, "Deadline not passed.");

        goal.status = Status.Failed;
        // Forfeit to owner 
        payable(owner).transfer(goal.amount);
    }

    function getMyGoal() external view returns (Goal memory) {
        return goals[msg.sender];
    }
}
