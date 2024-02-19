struct Student {
  var firstName: String
  var lastName: String
  var averageGrade: Double
}

class StudentJournal {
  var students: [Student] = []

  func addStudent(firstName: String, lastName: String, averageGrade: Double) {
      let newStudent = Student(firstName: firstName, lastName: lastName, averageGrade: averageGrade)
      students.append(newStudent)
  }

  func removeStudent(firstName: String, lastName: String) {
      students.removeAll { $0.firstName == firstName && $0.lastName == lastName }
  }

  func displayStudentsInfo() {
      for student in students {
          print("Name: \(student.firstName) \(student.lastName), GPA: \(student.averageGrade)")
      }
  }

  func listStudentsByGPA() {
      let sortedStudents = students.sorted { $0.averageGrade > $1.averageGrade }
      for student in sortedStudents {
          print("Name: \(student.firstName) \(student.lastName), GPA: \(student.averageGrade)")
      }
  }

  func averageScoreOfAllStudents() -> Double {
      let totalGrade = students.reduce(0.0) { $0 + $1.averageGrade }
      return totalGrade / Double(students.count)
  }

  func studentWithHighestGPA() -> Student? {
      return students.max(by: { $0.averageGrade < $1.averageGrade })
  }
}

let journal = StudentJournal()

journal.addStudent(firstName: "Alan", lastName: "Dickov", averageGrade: 75.6)
journal.addStudent(firstName: "Borya", lastName: "Lohov", averageGrade: 82.3)
journal.addStudent(firstName: "Azamat", lastName: "Gayev", averageGrade: 98.2)

print("All Students:")
journal.displayStudentsInfo()
print()

print("Students by GPA:")
journal.listStudentsByGPA()
print()

let averageScore = journal.averageScoreOfAllStudents()
print("Average score of all students: \(averageScore)")

if let studentWithHighestGPA = journal.studentWithHighestGPA() {
  print("Student with highest GPA: \(studentWithHighestGPA.firstName) \(studentWithHighestGPA.lastName), GPA: \(studentWithHighestGPA.averageGrade)")
}

print("\nRemove one student:")
journal.removeStudent(firstName: "Alan", lastName: "Dickov")
journal.displayStudentsInfo()
