//
//  ListViewModel.swift
//  Todolist
//
//  Created by suneel seelam on 22/03/22.
//

import Foundation

class ListViewModel: ObservableObject {
	
	@Published var items = [ItemModel]() {
		didSet {
			do {
				let data = try JSONEncoder().encode(items)
				UserDefaults.standard.set(data, forKey: "TodoItems")
			} catch {
				print("Failed to encode todo")
			}
		}
	}
	
	init() {
		getItems()
		
		
		
		let name = "swift ios"
		_ = name.components(separatedBy: " ")
		
		
	}
	
	func getItems() {
		guard let data = UserDefaults.standard.data(forKey: "TodoItems"),
		let todoItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
		self.items = todoItems
	}
	
	func deleteItem(indexSet: IndexSet) {
		items.remove(atOffsets: indexSet)
	}
	
	func moveItem(fromIndex: IndexSet, toIndex: Int) {
		items.move(fromOffsets: fromIndex, toOffset: toIndex)
	}
	
	func addItem(title: String, description: String) {
		let newItem = ItemModel(title: title, description: description)
		items.append(newItem)
	}
	
	func updateItem(item: ItemModel, with title: String, description: String) {
		if let index = items.firstIndex(of: item) {
			self.items[index].id = item.id
			self.items[index].title = title
			self.items[index].description = description
		}
	}
}
