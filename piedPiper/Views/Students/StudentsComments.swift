//
//  StudentsComments.swift
//  piedPiper
//
//  Created by Mauricio Alves da Silva Junior on 16/04/23.
//

import SwiftUI

struct StudentsComments: View {
    var student: Student
    
    var comments = ["Comment 1", "Comment 2", "Comment 3"]
    
    var body: some View {
        List(comments, id: \.self) { comment in
            Text(comment)
        }
        .navigationTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StudentsComments_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        StudentsGoals(student: modelData.students[0])
    }
}
