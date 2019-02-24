//
//  Model.swift
//  Schedule
//
//  Created by Alexey on 18.02.2019.
//  Copyright © 2019 AO. All rights reserved.
//

import Foundation

var Subjects:[[String: Any]] = [["Name": "Матан", "Classroom": "6-52", "Day" : 1, "H": 10, "M":10]]

func addSubject(name: String, class1: String, day: Int, h: Int, m:Int){
    
    Subjects.append(["Name": name, "Classroom": class1, "Day" : day, "H": h, "M":m ])
    saveData()
}

func removeSubject(at index: Int){
    Subjects.remove(at: index)
    saveData()
}

func saveData(){
    UserDefaults.standard.set(Subjects, forKey:"ToDoDataKey")
    UserDefaults.standard.synchronize()
}

func loadData(){
    if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]]{
        Subjects = array
    } else {
        Subjects = []
    }
}

