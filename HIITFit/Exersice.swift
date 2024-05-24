

import Foundation

struct Exersice{
    let exersiceName:  String
    let videoName: String

    enum ExerciseEnum: String{
        case squat =  "Sqaut"
        case stepUp = "Step Up"
        case burpee = "Burpee"
        case sunSalute = "Sun Salute"
    }
}


extension Exersice{
       static let exersices = [
           Exersice(exersiceName: ExerciseEnum.squat.rawValue,
                    videoName: "squat"),
           Exersice(exersiceName: ExerciseEnum.stepUp.rawValue,
                    videoName: "step-up"),
           Exersice(exersiceName: ExerciseEnum.burpee.rawValue,
                    videoName: "burpee"),
           Exersice(exersiceName: ExerciseEnum.sunSalute.rawValue,
                    videoName: "sun-salute")
       ]
   }
