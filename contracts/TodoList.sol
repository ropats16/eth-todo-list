pragma solidity ^0.5.0;
//Declaring the Solidity version

contract TodoList {
	//Declaring the smart contract with name "TodoList"
	uint public taskCount = 0;
	//uint initiates a state variable
	//taskCount will keep track of the number of task
	//Default Value 0 assigned to taskCount
	//"public" offers a way to read this value from 
	//the smart contract
	//"public" keyword creates a function taskCount() that
	//lets us access its value outside the contract

	struct Task {
		//struct allows us to create our own data type
		//we name this Task
		//below we define some attributes
		uint id;
		//id will be ID
		string content;
		//will simply be some text
		bool completed;
		//will check the completed state of Task
	}

	mapping(uint => Task) public tasks;
	//uint takes id from Task as a key
	//tasks itself are a value
	//uint, task is key-value pair
	//mapping creates an associative array like a data base
	//public creates a function to access task
	//outside mapping

	event TaskCreated(
		//creates an event to broadcast when new task completed
		uint id,
		string content,
		bool completed
		);

	constructor() public {
		//constructor function called when contract runs 1st time
		//in this case while deployment
		//this function will add tasks to the client side app
		//when smart contract is deployed

		createTask("Daily Reminder #1: All the benefits in life come from compound interest - relationships, money, habits, anything of importance.");

		createTask("Daily Reminder #2: Specific knowledge is found by pursuing your genuine curiosity and passion rather than whatever is hot right now.");

		//creates 2 default tasks with inputs as content
		//this also serves as verification of our code working 
		//when we connect to console and client side app
	
	}

	function createTask(string memory _content) public {
		//function to put Task struct in mapping
		taskCount ++;
		//taskCount increment every time task added to mapping
		tasks[taskCount] = Task(taskCount, _content, false);
		//creates an instance of Task
		//taskCount serves as id
		//input string is stored as string
		//bool value is false to show task not completed
		//stores it in tasks[taskCount]
		//taskCount index serves as serial number

		emit TaskCreated(taskCount, _content, false);
		//this calls the event and broadcasts

	}

}

