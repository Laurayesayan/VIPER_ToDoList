//
//  ToDoPresenter.swift
//  VIPER_ToDo_Example_2_4
//
//  Created by Лаура Есаян on 14.03.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import Foundation

class ToDoPresenter: ToDoPresenterProtocol {
    var view: ToDoViewProtocol?
    
    var interactor: ToDoInteractorInputProtocol?
    
    var wireFrame: ToDoWireFrameProtocol?
    
    func viewDidLoad() {
        interactor?.getTaskList()
    }
    
    func addNewTask(task: String) {
        interactor?.addTaskToDB(task: task)
        interactor?.getTaskList()
    }
    
    func removeTask(task id: Int) {
        interactor?.removeTaskFromDB(task: id)
        interactor?.getTaskList()
    }
}

extension ToDoPresenter: ToDoInteractorOutputProtocol {
    func taskListDidFetch(tasks: [String]) {
        view?.showTaskList(with: tasks)
    }
}
