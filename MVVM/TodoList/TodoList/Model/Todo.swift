

import UIKit


// TODO: Codable과 Equatable 추가
struct Todo: Codable, Equatable {
    let id: Int
    var isDone: Bool
    var detail: String
    var isToday: Bool
    
    // 구조체의 값을 수정을 원할시 mutating 키워드 필요
    mutating func update(isDone: Bool, detail: String, isToday: Bool) {
        // TODO: update 로직 추가
        self.isDone = isDone
        self.detail = detail
        self.isToday = isToday
        
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        // TODO: 동등 조건 추가
        return lhs.id == rhs.id
    }
}

class TodoManager {
    
    static let shared = TodoManager()
    
    static var lastId: Int = 0
    
    var todos: [Todo] = []
    
    func createTodo(detail: String, isToday: Bool) -> Todo {
        //TODO: create로직 추가
        let newId = TodoManager.lastId + 1 // 새로운 아이디 부여
        TodoManager.lastId = newId // 새롭게 추가된 아이디로 라스트아이디 초기화 다음 추가인덱스를 위해!
        return Todo(id: 1, isDone: false, detail: detail, isToday: isToday)
    }
    
    func addTodo(_ todo: Todo) {
        //TODO: add로직 추가
        todos.append(todo)
        saveTodo()
    }
    
    func deleteTodo(_ todo: Todo) {
        //TODO: delete 로직 추가
        // 필터링을 이용한 제거
        todos.filter{ (exstringTodo) -> Bool in
            return todo.id != exstringTodo.id
        } // 새로운 리스트로 업데이트해준다
        
//        //인덱스를 이용한 제거
//        if let index = todos.firstIndex(of:todo) { // 파라미터러 전달된 투두 객체와 리스트에 존재하는 같은 엘리먼트를 찾고 인덱스를 리턴해준다
//            todos.remove(at: index) // 리턴된 인덱스로 삭제
//        }
        saveTodo()
    }
    
    func updateTodo(_ todo: Todo) {
        //TODO: updatee 로직 추가
        guard let index = todos.firstIndex(of: todo) else { return }
        todos[index].update(isDone: todo.isDone, detail: todo.detail, isToday: todo.isToday)
        
        saveTodo()
    }
    
    func saveTodo() {
        Storage.store(todos, to: .documents, as: "todos.json")
    }
    
    func retrieveTodo() {
        todos = Storage.retrive("todos.json", from: .documents, as: [Todo].self) ?? []
        
        let lastId = todos.last?.id ?? 0
        TodoManager.lastId = lastId
    }
}

