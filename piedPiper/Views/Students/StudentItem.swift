//
//  StudentItem.swift
//  piedPiper
//
//  Created by Mauricio Alves da Silva Junior on 11/04/23.
//

import SwiftUI

struct StudentItem: View {
    @EnvironmentObject var modelData: ModelData
    
    var student: Student
    
    var students: [Student] {
        modelData.students
    }
    
    var landmarkIndex: Int {
        modelData.students.firstIndex(where: { $0.id == student.id})!
    }
    var body: some View {
        TabView {
            StudentsDetail(student: student)
                .tabItem{
                    Label("Student", systemImage: "star")
                }
            
            StudentsGoals(student: student)
                .tabItem{
                    Label("Goals", systemImage: "star")
                }
            
            StudentsComments(student: student)

                .tabItem{
                    Label("Comments", systemImage: "star")
                }

            StudentsFeedbacks(student: student)
                .tabItem{
                    Label("Feedbacks", systemImage: "star")
                }
        }
    }
}

struct StudentItem_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        StudentItem(student: modelData.students[0])
            .environmentObject(modelData)
    }
}
