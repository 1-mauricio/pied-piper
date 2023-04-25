//
//  StudentsComments.swift
//  piedPiper
//
//  Created by Mauricio Alves da Silva Junior on 16/04/23.
//

import SwiftUI

struct StudentsComments: View {
    var student: Student
//    var titulo: String
//    var professor: String
//    var data: String
    
    var comments = ["Comment 1", "Comment 2", "Comment 3"]
    
    var body: some View {
        NavigationView {
            List {
                HStack{
                    NavigationLink() {
                        StudentDetail(student: student)
                    } label: {
                    Text("Atraso")
                    Spacer()
                        VStack{
                            Text("Kiev Gama")
                                .font(.system(size: 15))
                                .opacity(0.5)
                            Text("13/04/2023")
                                .font(.system(size: 12))
                                .opacity(0.7)
                        }
                    }
                }
            }
            .navigationTitle("Comments")
            }
        }
    }

struct StudentsComments_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        StudentsComments(student: modelData.students[0])
    }
}
