//
//  StudentsGoals.swift
//  piedPiper
//
//  Created by Mauricio Alves da Silva Junior on 13/04/23.
//

import SwiftUI

struct StudentsGoals: View {
    var student: Student
    
    var goals = ["Goal 1", "Goal 2", "Goal 3"]
    
    var body: some View {
        List(goals, id: \.self) { goal in
            Text(goal)
        }
        .navigationTitle("Goals")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StudentsGoals_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        StudentsGoals(student: modelData.students[0])
    }
}
