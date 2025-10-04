//
//  FavoritesView.swift
//  ExamBattlebucks
//
//  Created by selegic mac 01 on 03/10/25.
//

import SwiftUI
import CoreData

struct FavoritesView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            List {
                if items.isEmpty {
                    HStack {
                        Text("No Items")
                            .bold()
                            .font(.title3)
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                }
                ForEach(items) { item in
                    HStack {
                        NavigationLink(destination: FavoriteDetailsPage(item: item)) {
                            Text("\(item.userId). ")
                                .bold()
                                .font(.system(size: 17))
                            
                            Text(item.title ?? "")
                                .font(.system(size: 17))
                        }
                        
                        Spacer()
                        
                        Button {
                            deleteItem(item)
                        } label: {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 25, alignment: .trailing)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .padding(.horizontal, 20)
                }
                .onDelete(perform: deleteItems)
            }
        }
        .navigationTitle(Text("Favorites"))
    }
    
    private func deleteItem(_ item: Item) {
        withAnimation {
            viewContext.delete(item)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
