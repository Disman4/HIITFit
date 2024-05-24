import SwiftUI

struct ContentView: View {
  var body: some View {
      TabView{
          WelcomeView()
          ForEach(Exersice.exersices.indices, id: \.self){ index in
              ExerciseView(index: index)
          }

      }
      .tabViewStyle(PageTabViewStyle())
      .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
