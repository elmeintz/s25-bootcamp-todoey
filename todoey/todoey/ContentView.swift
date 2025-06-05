import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var item: String
    var isDone: Bool
}

struct ContentView: View {
    @State private var todos: [Todo] = []
    func deleteItems(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }

    var body: some View {
        VStack {
            Text("To-Do")
                .font(.system(size: 35, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)

            List {
                ForEach($todos) { $todo in
                    HStack {
                        Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(.white)
                            .onTapGesture {
                                todo.isDone.toggle()
                            }
                        TextField("New Task", text: $todo.item)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            
            .listStyle(.plain)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 3)
            )

            Spacer()

            Button("Reminder") {
                todos.append(Todo(item: "", isDone: false))
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
        .background(Color.black)
        .preferredColorScheme(.dark)
    }
}


#Preview {
    ContentView()
}

