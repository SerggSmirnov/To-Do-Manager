//
//  TasksStorage.swift
//  To-Do Manager
//
//  Created by Сергей Смирнов on 30.08.2022.
//

protocol TasksStorageProtocol {
    func loadTasks() -> [TaskProtocol]
    func saveTasks(_ tasks: [TaskProtocol])
}

class TasksStorage: TasksStorageProtocol {
    func loadTasks() -> [TaskProtocol] {
        let testTasks: [TaskProtocol] = [
            Task(title: "Byu beard", type: .normal, status: .planned),
            Task(title: "Washing a cat", type: .important, status: .planned),
            Task(title: "Arnold's dept", type: .important, status: .completed),
            Task(title: "Byu vacuum cleaner", type: .normal, status: .completed),
            Task(title: "Give flowers wife", type: .important, status: .planned),
            Task(title: "Call to perents", type: .important, status: .planned),
        ]
        return testTasks
    }
    
    func saveTasks(_ tasks: [TaskProtocol]) {}
}
