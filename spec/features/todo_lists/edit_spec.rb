require 'spec_helper'

describe 'Creating editing lists' do
	let!(:todo_list) { TodoList.create(title: "Groceries", description: "Grocery list.")}

	def update_todo_list(options={})
		options[:title] ||= "My todo list"
		options[:description] ||= "This is my todo list"
		todo_list = options[:todo_list]

		within "#todo_list_#{todo_list.id}" do
			click_link "Edit"
		end

		fill_in "Title", with: options [:title]
		fill_in "Description", with: options[:description]
		click_button "Update Todo list"

	end

	it "updates a todo list successfullly with correct information" do
		
		

		visit "/todo_lists"
		update_todo_list todo_list: todo_list, 
						 title: "New title", 
						 description: "New Description"

		todo_list.reload

		expect(page).to have_content("Todo list was successfully updated.")
		expect(todo_list.title).to eq("New title")
		expect(todo_list.description).to eq("New Description")

	end
end
























