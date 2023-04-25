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
        NavigationView{
            ZStack(alignment: .top) {
                List{
                    HStack{
                        Text("Aprender front")
                        Spacer()
                        Text("Completed")
                            .font(.system(size: 15))
                            .opacity(0.5)
                    }
                    HStack{
                        Text("Aprender a usar o Figma")
                        Spacer()
                        Text("Completed")
                            .font(.system(size: 15))
                            .opacity(0.5)
                    }
                    HStack{
                        Text("Fazer tela de login")
                        Spacer()
                        Text("InProgress")
                            .font(.system(size: 15))
                            .opacity(0.5)
                    }
                }
                .navigationTitle("Goals")
            }
        }
    }
}

struct StudentsGoals_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        StudentsGoals(student: modelData.students[0])
    }
}
