//
//  ContentView.swift
//  landmarks-swift
//
//  Created by Mauricio Alves da Silva Junior on 17/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        StudentsList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
