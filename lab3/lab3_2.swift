struct Task {
  var title: String
  var description: String
  var isCompleted: Bool
}

class ToDoList {
  var tasks: [Task] = []

  func addTask(title: String, description: String) {
      let newTask = Task(title: title, description: description, isCompleted: false)
      tasks.append(newTask)
  }

  func removeTask(title: String) {
      tasks.removeAll { $0.title == title }
  }

  func changeTaskStatus(title: String, isCompleted: Bool) {
      if let index = tasks.firstIndex(where: { $0.title == title }) {
          tasks[index].isCompleted = isCompleted
      }
  }

  func displayAllTasks() {
      for task in tasks {
          print("Title: \(task.title), Description: \(task.description), Completed: \(task.isCompleted ? "Yes" : "No")")
      }
  }

  func displayCompletedTasks() {
      let completedTasks = tasks.filter { $0.isCompleted }
      print("Completed Tasks:")
      for task in completedTasks {
          print("Title: \(task.title), Description: \(task.description)")
      }
  }

  func displayOutstandingTasks() {
      let outstandingTasks = tasks.filter { !$0.isCompleted }
      print("Outstanding Tasks:")
      for task in outstandingTasks {
          print("Title: \(task.title), Description: \(task.description)")
      }
  }

  func clearCompletedTasks() {
      tasks.removeAll { $0.isCompleted }
  }
}

let toDoList = ToDoList()

toDoList.addTask(title: "Homework", description: "Do homework")
toDoList.addTask(title: "Extra lessons", description: "Go to ensglish extra lessonsw")

print("\nAll Tasks:")
toDoList.displayAllTasks()

toDoList.changeTaskStatus(title: "Homework", isCompleted: true)

print()
toDoList.displayCompletedTasks()

print()
toDoList.displayOutstandingTasks()

toDoList.clearCompletedTasks()

print("\nAll Tasks after clearing completed tasks:")
toDoList.displayAllTasks()