//
//  Cotroller.swift
//  ExamBattlebucks
//
//  Created by selegic mac 01 on 03/10/25.
//
import SwiftUI
import Combine

@MainActor
class Cotroller: ObservableObject {
    @Published var listData: [Model] = []
    @Published var searchText: String = ""
    
    var filterdata: [Model]? {
        if searchText.isEmpty {
            return listData
        }else {
            return listData.filter({$0.title?.localizedCaseInsensitiveContains(searchText) ?? false})
        }
    }
    
    func fetchData() {
        NetworkService.shared.fetchUsers { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.listData = data
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
