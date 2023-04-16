//
//  StudentsFeedbacks.swift
//  piedPiper
//
//  Created by Mauricio Alves da Silva Junior on 16/04/23.
//

import SwiftUI

struct StudentsFeedbacks: View {
    var student: Student
    
    var feedbacks = ["Feedback 1", "Feedback 2", "Feedback 3"]
    
    var body: some View {
        List(feedbacks, id: \.self) { feedback in
            Text(feedback)
        }

        .navigationTitle("Feedbacks")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StudentsFeedbacks_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        StudentsGoals(student: modelData.students[0])
    }
    
}
