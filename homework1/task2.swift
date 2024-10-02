import Foundation

struct Students: Codable {
    let students: [Student]
}

struct Student: Codable {
    let id: Int
    let name: String
    let age: Int?
    let subjects: [String]?
    let address: Address?
    let scores: [String: Int?]?
    let hasScholarship: Bool?
    let graduationYear: Int?
}

struct Address: Codable {
    let street: String
    let city: String
    let postalCode: String?
}

class ModelParser {
    func JSONparser(jsonData: Data) -> [Student] {
        let studentData = try! JSONDecoder().decode(Students.self, from: jsonData)
        for student in studentData.students {
            showStudentInfo(student)
        }
        return studentData.students
    }
    
    func showStudentInfo(_ student: Student) {
        print("ID: \(student.id)")
        print("Name: \(student.name)")
        print("Age: \(student.age ?? 0)")
        print("Subjects: \(student.subjects?.joined(separator: ", ") ?? "None")")
        
        print("Address: \(student.address.map { "\($0.city), \($0.street), Postal Code: \($0.postalCode ?? "None")" } ?? "None")")
        
        print("Scores: \(student.scores?.map { "\($0): \($1 ?? 0)" }.joined(separator: ", ") ?? "None")")
        
        print("Has scholarship: \(student.hasScholarship.map { $0 ? "Yes" : "No" } ?? "N/A")")
        
        print("Graduation year: \(student.graduationYear.map { String($0) } ?? "N/A")\n")
    }
    
    func findOldest(from students: [Student]) {
        let validStudents = students.filter { $0.age != nil }
            let sortedStudents = validStudents.sorted { ($0.age ?? 0) > ($1.age ?? 0) }

            if let oldestStudent = sortedStudents.first {
                print("The oldest student's name is \(oldestStudent.name) with age of \(oldestStudent.age!) years old.")
            } else {
                print("No students with age found.")
            }
    }
}

func executionTask2() {
    print("Task 2. Part 1.")
    let fileURL = URL(fileURLWithPath: "/Users/ksenia/Documents/swift/homework1/homework1/students.json")
    do {
        let jsonData = try Data(contentsOf: fileURL)
        let parserClass = ModelParser()
        let studentsData = parserClass.JSONparser(jsonData: jsonData)
        print("Part 2.")
        parserClass.findOldest(from: studentsData)
    } catch {
        print("Failed to read data from students.json: \(error)")
    }
    
    print("\n")
}
