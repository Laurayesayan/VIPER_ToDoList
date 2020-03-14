//
//  ToDoWireFrame.swift
//  VIPER_ToDo_Example_2_4
//
//  Created by Лаура Есаян on 14.03.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import Foundation

class ToDoWireFrame: ToDoWireFrameProtocol {
    class func createToDoModule(toDoRef: ViewController) {
        let presenter: ToDoPresenterProtocol & ToDoInteractorOutputProtocol = ToDoPresenter()

        toDoRef.presenter = presenter
        toDoRef.presenter?.wireFrame = ToDoWireFrame()
        toDoRef.presenter?.view = toDoRef
        toDoRef.presenter?.interactor = TodoInteractor()
        toDoRef.presenter?.interactor?.presenter = presenter

    }
}
