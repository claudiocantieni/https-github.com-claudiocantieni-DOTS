//
//  InputView.swift
//  DOTS
//
//  Created by Claudio Cantieni on 01.05.22.
//

import SwiftUI

struct InputView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
  //  @FetchRequest(sortDescriptors: []) var hearts: FetchedResults<Hearts>
    // TODO: change to :Float
    @State private var rhr1 = ""
    //@Binding var isInputViewShowing: Bool
    var model:ContentModel
    
    var body: some View {
        
        VStack {
            
            HStack {
                Spacer()
                
                Button("Speichern") {
                    
                    addData()
                    
                    clear()
                    
                    model.fetchHearts()
                    
                    
                    
                }
            }
            //TODO: textfields possible to copy paste letters -> prevent:https://programmingwithswift.com/numbers-only-textfield-with-swiftui/
            HStack {
                Text("Ruheherzfrequenz:")
                TextField("50", text: $rhr1)
                    .keyboardType(.decimalPad)    
            }

        Spacer()
        }
        .padding(15)
    }
    
    func clear() {
        rhr1 = ""
 
    }
    func addData() {
        //TODO: adapt to textfields
        
        let hearts = Hearts(context: viewContext)
        hearts.timestamp = Date()
        hearts.rhr = Double(rhr1) as NSNumber?

        
        
       
       
        
        do {
            try viewContext.save()
            
        }
        catch {
            
        }
        
    }
    
}

