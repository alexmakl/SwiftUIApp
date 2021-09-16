//
//  FoodListView.swift
//  SwiftUIApp
//
//  Created by Alexander on 15.09.2021.
//

import SwiftUI
import Combine

final class FoodListViewModel: ObservableObject {
    
    @Published private(set) var filterButtonName = "Switch Faves"
    
    @Published private(set) var foods = [Food(name: "Cherry", isFav: true),
                                         Food(name: "Apple", isFav: false),
                                         Food(name: "Cheese", isFav: true),
                                         Food(name: "Tomato", isFav: false)]
}

struct Food: Identifiable {
    let id = UUID()
    let name: String
    let isFav: Bool
}

// MARK: - Views

struct FoodListView: View {
    @ObservedObject var viewModel = FoodListViewModel()
    
    @State var favesShowed: Bool = false
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    FilterView(favesShowed: $favesShowed).environmentObject(viewModel)
                    ForEach(viewModel.foods) { food in
                        if !self.favesShowed || food.isFav {
                            NavigationLink(destination: FoodView()) {
                                Text(food.name)
                            }
                        }
                    } // ForEach
                }
            }
            .navigationBarHidden(false)
            .navigationBarTitle("Foods")
        }
    }
}

struct FilterView: View {
    
    @Binding var favesShowed: Bool
    
    @EnvironmentObject var viewModel: FoodListViewModel
    
    var body: some View {
        Toggle(isOn: $favesShowed) {
            Text(viewModel.filterButtonName)
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
    }
}
