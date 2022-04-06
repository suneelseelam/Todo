//
//  ItemModel.swift
//  Todolist
//
//  Created by suneel seelam on 22/03/22.
//

import Foundation

struct ItemModel: Identifiable, Equatable, Codable {
	var id: String
	var title: String
	var description: String
	
	init(id: String = UUID().uuidString, title: String, description: String) {
		self.id = id
		self.title = title
		self.description = description
	}
	
	static func == (lhs: ItemModel, rhs: ItemModel) -> Bool {
		lhs.id == rhs.id
	}
}

