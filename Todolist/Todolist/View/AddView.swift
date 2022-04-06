//
//  AddView.swift
//  Todolist
//
//  Created by suneel seelam on 22/03/22.
//

import SwiftUI

enum FocusableField: Hashable {
  case title
  case description
}

struct AddView: View {
	
	@Environment(\.presentationMode) var presentationMode
	
	@ObservedObject var listViewModel: ListViewModel
	
	@FocusState private var focus: FocusableField?
	@State var titleTextFieldText: String = ""
	@State var descTextFieldText: String = ""
	@State var showAlert: Bool = false
	
	var isEdit:Bool = false
	var itemModel: ItemModel?
	
	init(vm: ListViewModel, itemModel: ItemModel? = nil) {
		self.listViewModel = vm
		if let itemModel = itemModel {
			self.itemModel = itemModel
			self.isEdit = true
			self._titleTextFieldText = State(initialValue: itemModel.title)
			self._descTextFieldText = State(initialValue: itemModel.description)
		}
	}
	
	var body: some View {
		NavigationWrapperView(wrappedNavigation: !isEdit) {
			Form {
				TextField("Title", text: $titleTextFieldText)
					.focused($focus, equals: .title)
					.submitLabel(.next)
					.onSubmit {
						focus = .description
					}
				TextArea("Description", text: $descTextFieldText)
					.focused($focus, equals: .description)
					.submitLabel(.done)
					.accessibilityLabel("Todo Description")
					.onSubmit {
						focus = nil
					}
			}
			.navigationTitle(isEdit ? "update Item" : "Add an Item")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button("Save",action: saveItem)
						.disabled(!textIsAppropriate())
				}
//				ToolbarItemGroup(placement: .keyboard) {
//					Spacer()
//					Button("Done") {
////						focus = false
//					}
//				}
			}

			//		.alert(isPresented: $showAlert, content: {
			//			Alert(title: Text("Item must have at least 3 character long!!! "))
			//		})
		}
	}
	
	
	
	func saveItem() {
		if self.isEdit, let todoItem = self.itemModel {
			listViewModel.updateItem(item: todoItem, with: titleTextFieldText, description:  descTextFieldText)
		} else {
			listViewModel.addItem(title: titleTextFieldText, description: descTextFieldText)
		}
		presentationMode.wrappedValue.dismiss()
	}
	
	func textIsAppropriate() -> Bool {
		if titleTextFieldText.count < 3 && descTextFieldText.count < 3 {
//			showAlert.toggle()
			return false
		}
		return true
	}
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView{
			AddView(vm:  ListViewModel())
		}
		//.environmentObject(ListViewModel())
    }
}
