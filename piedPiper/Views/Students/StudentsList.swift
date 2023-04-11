//
//  StudentsList.swift
//  piedPiper
//
//  Created by Mauricio Alves da Silva Junior on 21/03/23.
//

import SwiftUI

struct StudentsList: View {
    @EnvironmentObject var modelData: ModelData
    
    var students: [Student] {
        modelData.students
    }
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(students) { student in
                    NavigationLink {
                        StudentItem(student: student)
                    } label: {
                        StudentsRow(student: student)
                    }
                }
            }
            .navigationBarTitle("Pied Piper")
        }
    }
}

struct StudentsList_Previews: PreviewProvider {
    static var previews: some View {
        StudentsList()
            .environmentObject(ModelData())
    }
}
