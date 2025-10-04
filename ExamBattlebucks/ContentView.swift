//
//  ContentView.swift
//  ExamBattlebucks
//
//  Created by selegic mac 01 on 03/10/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var viewModel = Cotroller()
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            if viewModel.filterdata?.isEmpty == true {
                VStack(spacing: 16) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .scaleEffect(2)
                    
                        Text("Loading data...")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(.systemGroupedBackground))
            }else {
                List {
                    ForEach(viewModel.filterdata ?? []) { item in
                        HStack {
                            NavigationLink(destination: DetailsPage(item: item)) {
                                Text("\(item.userId ?? 0). ")
                                    .bold()
                                    .font(.system(size: 17))
                                
                                Text(item.title ?? "")
                                    .font(.system(size: 17))
                            }
                            
                            Spacer()
                            
                            Button {
                                if let content =  items.first(where: { $0.id == item.id }) {
                                    viewContext.delete(content)
                                    do {
                                        try viewContext.save()
                                    }catch {
                                        print("Error: \(error.localizedDescription)")
                                    }
                                }else {
                                    addItem(id: item.id ?? 0, title: item.title ?? "", body: item.body ?? "", userId: item.userId ?? 0)
                                }
                            } label: {
                                Image(systemName: items.contains(where: { $0.id == item.id }) ? "heart.fill" : "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color.black)
                                    .frame(width: 25, height: 25, alignment: .trailing)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
        }
        .searchable(text: $viewModel.searchText)
        .onAppear {
            viewModel.fetchData()
        }
        .navigationTitle("Home")
    }

    private func addItem(id: Int64, title: String, body: String, userId: Int64) {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.id = id
            newItem.title = title
            newItem.body = body
            newItem.userId = userId

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
