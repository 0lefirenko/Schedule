
import Foundation
class Subject {
    var Name = String()
    var Classroom = String()
    var Day = Int()
    var Hour = Int()
    var Minute = Int()
    
}

var Subjectc : [Subject] = []

func addSubject(name: String, class1: String, day: Int, h: Int, m:Int){
    let tempSubject = Subject()
    tempSubject.Name = name
    tempSubject.Classroom = class1
    tempSubject.Day = day
    tempSubject.Hour = h
    tempSubject.Minute = m
    Subjectc.append(tempSubject)
    Subjectc.sort(by: sortCondition)
    saveData()
}

func removeSubject(at index: Int){
    Subjectc.remove(at: index)
    saveData()
}

func saveData(){
    if (Subjectc.count > 0){
    var nameS : [String] = []
    var classRoomS : [String] = []
    var dayS : [Int] = []
    var hourS : [Int] = []
    var minS : [Int] = []
    
    for i in 0...(Subjectc.count-1){
        nameS.append(Subjectc[i].Name)
        classRoomS.append(Subjectc[i].Classroom)
        dayS.append(Subjectc[i].Day)
        hourS.append(Subjectc[i].Hour)
        minS.append(Subjectc[i].Minute)
    }
    UserDefaults.standard.set(nameS, forKey: "Name")
    UserDefaults.standard.set(classRoomS, forKey: "ClassRoom")
    UserDefaults.standard.set(dayS, forKey: "Day")
    UserDefaults.standard.set(hourS, forKey: "Hour")
    UserDefaults.standard.set(minS, forKey: "Minute")
    UserDefaults.standard.synchronize()}
}

func loadData(){
    var nameS : [String] = []
    var classRoomS : [String] = []
    var dayS : [Int] = []
    var hourS : [Int] = []
    var minS : [Int] = []
    if let array = UserDefaults.standard.array(forKey: "Name") as? [String]{
        nameS = array
    } else {nameS=[]}
    if let array = UserDefaults.standard.array(forKey: "ClassRoom") as? [String]{
        classRoomS = array
    } else {classRoomS = []}
    if let array = UserDefaults.standard.array(forKey: "Day") as? [Int]{
        dayS = array
    } else {dayS = []}
    if let array = UserDefaults.standard.array(forKey: "Hour") as? [Int]{
        hourS = array
    } else {hourS = []}
    if let array = UserDefaults.standard.array(forKey: "Minute") as? [Int]{
        minS = array
    }else{minS = []}
    if (nameS.count > 0) {
    for i in 0...(nameS.count-1) {
        addSubject(name: nameS[i], class1: classRoomS[i], day: dayS[i], h: hourS[i], m: minS[i])
    }
        
        
    }
}

func sortCondition(this:Subject, that:Subject) -> Bool{
    var thatM = Int()
    var thisM = Int()
    thatM = that.Day*1440 + that.Hour * 60 + that.Minute
    thisM = this.Day*1440 + this.Hour * 60 + this.Minute
    return thatM > thisM
}

