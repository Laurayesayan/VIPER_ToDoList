//
//  ToDoProtocols.swift
//  VIPER_ToDo_Example_2_4
//
//  Created by Лаура Есаян on 14.03.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import Foundation

protocol ToDoViewProtocol: class {
    func showTaskList(with tasks: [String])
}

protocol ToDoInteractorOutputProtocol: class {
    func taskListDidFetch(tasks: [String])
}

protocol ToDoInteractorInputProtocol: class {
    var presenter: ToDoInteractorOutputProtocol? {get set}
    
    func getTaskList()
    func addTaskToDB(task: String)
    func removeTaskFromDB(task id: Int)
}

protocol ToDoWireFrameProtocol: class {
    
}

protocol ToDoPresenterProtocol: class {
    var view: ToDoViewProtocol? {get set}
    var interactor: ToDoInteractorInputProtocol? {get set}
    var wireFrame: ToDoWireFrameProtocol? {get set}
    
    func viewDidLoad()
    func addNewTask(task: String)
    func removeTask(task id: Int)
}
