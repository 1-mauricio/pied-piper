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
            Spacer()
            CircleImage(image: student.image)
                  .offset()
                  .padding(.bottom)

            VStack(alignment: .leading) {
                HStack{
                    Text(student.name)
                        .font(.title)
                }
                
                
                HStack {
                    Text(student.park)
                    Spacer()
                    Text(student.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
            }
              .padding()
            TabViewController()

              Spacer()
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
