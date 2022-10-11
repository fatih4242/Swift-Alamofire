//
//  ContentView.swift
//  Joke
//
//  Created by Fatih Toker on 11.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State var countJoke = 0
    @State var arr = [String]()
    @ObservedObject var jokesVM = JokesViewModel()
    var body: some View {
        
        NavigationView{
            
          
           
            List(jokesVM.jokes){element in
                Text(element.joke)
                
            }
          
            .navigationTitle(Text("Jokes App"))
            .toolbar{
                Button {
                    addJoke()
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
            
            
        

    }
    func addJoke(){
      
        jokesVM.getJokes()
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
