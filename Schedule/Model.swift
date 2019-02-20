//
//  Model.swift
//  Schedule
//
//  Created by Alexey on 18.02.2019.
//  Copyright © 2019 AO. All rights reserved.
//

import Foundation
//file for app-logic

var Subjects: [[String: Any]] {
    set{
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    
    get{
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]]
        {return array} else {return []}
    }
}

func addSubject(nameSubject: String, classRoom: String, time: String){
    Subjects.append(["Name": nameSubject, "Classroom": classRoom, "Time": time]);
}

func removeSubject(at index: Int){
    Subjects.remove(at: index)
}


