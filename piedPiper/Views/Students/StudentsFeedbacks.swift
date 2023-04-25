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
        NavigationView {
            List {
                HStack{
                    Text("Pouco presente")
                    Spacer()
                    VStack{
                        Text("Kiev Gama")
                            .font(.system(size: 15))
                            .opacity(0.5)
                        Text("17/04/2023")
                            .font(.system(size: 12))
                            .opacity(0.7)
                    }
                }
            }
            .navigationTitle("Feedbacks")
            }
        }
    }
struct StudentsFeedbacks_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        StudentsFeedbacks(student: modelData.students[0])
    }
    
}
