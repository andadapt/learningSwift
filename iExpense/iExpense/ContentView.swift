//
//  ContentView.swift
//  iExpense
//
//  Created by Simon Wheatcroft on 10/05/2024.
//

import SwiftUI

struct ExpenseItem : Identifiable, Codable {
    var id =  UUID()
    let name: String
    let type: String
    let amount: Double
    
    
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
                
            }
        }
    }
    
    
    
    
    
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}


struct ContentView: View {

    @State private var showingAddExpense = false
    @State private var expenses = Expenses()
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }

                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add expense", systemImage: "plus") {
                    
showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddExpense(expenses: expenses)
        }
    }
    
    func removeItems(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
        
    }
}

#Preview {
    ContentView()
}
