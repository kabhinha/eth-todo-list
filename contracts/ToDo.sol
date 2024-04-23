// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ToDo {
    uint public TaskCount = 0;
    struct Task {
        uint id;
        string content;
        bool completed;
    }
    constructor() public {
        addTask("Welcome me!");
    }

    event taskCreated(
        uint id,
        string content,
        bool completed
    );

    event taskCompleted(
        uint id,
        bool completed
    );

    mapping(uint=>Task) public tasks;

    function addTask(string memory _content) public {
        TaskCount++;
        tasks[TaskCount] = Task(TaskCount, _content, false);
        emit taskCreated(TaskCount, _content, false);
    }

    function taskComplete(uint _id) public {
        Task memory _tempTask = tasks[_id];
        _tempTask.completed = !_tempTask.completed;
        tasks[_id] = _tempTask;
        emit taskCompleted(_tempTask.id, _tempTask.completed);
    }
}
