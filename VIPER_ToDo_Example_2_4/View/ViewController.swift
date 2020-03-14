//
//  ViewController.swift
//  VIPER_ToDo_Example_2_4
//
//  Created by Лаура Есаян on 14.03.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ToDoViewProtocol {
    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var toDoTextField: UITextField!
    var presenter: ToDoPresenterProtocol?
    
    var taskList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ToDoWireFrame.createToDoModule(toDoRef: self)
        presenter?.viewDidLoad()
    }

    @IBAction func addTask(_ sender: Any) {
        if let taskFromTextField = toDoTextField.text {
            presenter?.addNewTask(task: taskFromTextField)
        }
        
        toDoTextField.text = ""
    }
    
    func showTaskList(with tasks: [String]) {
        taskList = tasks
        toDoTableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        
        cell.textLabel?.text = taskList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDoTableView.deselectRow(at: indexPath, animated: true)
        presenter?.removeTask(task: indexPath.row)
    }
    
}

