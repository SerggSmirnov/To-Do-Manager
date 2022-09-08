//
//  TasksStorage.swift
//  To-Do Manager
//
//  Created by Сергей Смирнов on 30.08.2022.
//

import Foundation

protocol TasksStorageProtocol {
    func loadTasks() -> [TaskProtocol]
    func saveTasks(_ tasks: [TaskProtocol])
}

class TasksStorage: TasksStorageProtocol {
    
    private var storage = UserDefaults.standard
    
    var storageKey = "tasks"
    
    private enum TaskKey: String {
        case title, type, status
    }
    
    func loadTasks() -> [TaskProtocol] {
        var resultTasks: [TaskProtocol] = []
        let tasksFromStorage = storage.array(forKey: storageKey) as? [[String:String]] ?? []
        for task in tasksFromStorage {
            guard let title = task[TaskKey.title.rawValue],
                  let typeRaw = task[TaskKey.type.rawValue],
                  let statusRaw = task[TaskKey.status.rawValue] else {
                continue
            }
            let type: TaskPriority = typeRaw == "important" ? .important : .normal
            let status: TaskStatus = statusRaw == "planned" ? .planned : .completed
            
            resultTasks.append(Task(title: title, type: type, status: status))
        }
        return resultTasks
    }
    
    func saveTasks(_ tasks: [TaskProtocol]) {
        var arrayForStorage: [[String:String]] = []
        tasks.forEach { task in
            var newElementForStorage: [String:String] = [:]
            newElementForStorage[TaskKey.title.rawValue] = task.title
            newElementForStorage[TaskKey.type.rawValue] = (task.type == .important) ? "important" : "normal"
            newElementForStorage[TaskKey.status.rawValue] = (task.status == .planned) ? "planed" : "completed"
            arrayForStorage.append(newElementForStorage)
        }
        storage.set(arrayForStorage, forKey: storageKey)
    }
 /*
    func loadTasks() -> [TaskProtocol] {
        let testTasks: [TaskProtocol] = [
            Task(title: "Byu beard", type: .normal, status: .planned),
            Task(title: "Washing a cat", type: .important, status: .planned),
            Task(title: "Arnold's dept", type: .important, status: .completed),
            Task(title: "Byu vacuum cleaner", type: .normal, status: .completed),
            Task(title: "Give flowers wife", type: .important, status: .planned),
            Task(title: "Call to perents", type: .important, status: .planned),
            Task(title: "Invate to party Adolf, Jekky, Leanardo, Will and Bruce", type: .important, status: .planned),
        ]
        return testTasks
    }
    func saveTasks(_ tasks: [TaskProtocol]) {}
  */
}
