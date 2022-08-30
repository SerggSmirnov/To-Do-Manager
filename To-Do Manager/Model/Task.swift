//
//  Task.swift
//  To-Do Manager
//
//  Created by Сергей Смирнов on 30.08.2022.
//

enum TaskPriority {
    case normal, important
}

enum TaskStatus {
    case planned, completed
}

protocol TaskProtocol {
    var title: String {get set}
    
    var type: TaskPriority {get set}
    
    var status: TaskStatus {get set}
}

struct Task: TaskProtocol {
    var title: String
    
    var type: TaskPriority
    
    var status: TaskStatus
}
