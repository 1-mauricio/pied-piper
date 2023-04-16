//
//  StudentsDetail.swift
//  piedPiper
//
//  Created by Mauricio Alves da Silva Junior on 21/03/23.
//

import SwiftUI

struct StudentsDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    var student: Student
    
    var students: [Student] {
        modelData.students
    }
    
    var landmarkIndex: Int {
        modelData.students.firstIndex(where: { $0.id == student.id})!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: student.image)
                    .padding(.vertical, 16)
                    .padding(.bottom, 8)
                
                VStack(alignment: .leading) {
                    HStack{
                        Text(student.name)
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(student.park)
                            .font(.subheadline)
                        Text(student.state)
                            .font(.subheadline)
                    }
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("About \(student.name)")
                        .font(.title2)
                        .foregroundColor(.primary)
                    
                    Text(student.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding()
            }
        }
        .navigationTitle(student.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

    
    struct StudentsDetail_Previews: PreviewProvider {
        static let modelData = ModelData()
        
        static var previews: some View {
            StudentsDetail(student: modelData.students[0])
                .environmentObject(modelData)
        }
    }

