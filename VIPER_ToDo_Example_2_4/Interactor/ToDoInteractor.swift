//
//  ToDoInteractor.swift
//  VIPER_ToDo_Example_2_4
//
//  Created by Лаура Есаян on 14.03.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import Foundation

class TodoInteractor: ToDoInteractorInputProtocol {
    var presenter: ToDoInteractorOutputProtocol?
    private var taskList = [String]()
    
    func getTaskList() {
        taskList = getSavedTasks()
        presenter?.taskListDidFetch(tasks: taskList)
    }
    
    func addTaskToDB(task: String) {
        addTask(task: task)
    }
    
    func removeTaskFromDB(task id: Int) {
        remove(task: id)
    }
    
    private func addTask(task: String) {
        self.taskList.append(task)
        RealmPersistance.shared.setTask(newTask: task)
        RealmPersistance.shared.recordTask()
    }
    
    private func remove(task id: Int) {
        RealmPersistance.shared.deleteTask(toDelete: self.taskList[id])
        self.taskList.remove(at: id)
    }
    
    private func getSavedTasks() -> [String] {
        return RealmPersistance.shared.getRecoordedTask()
    }
}
