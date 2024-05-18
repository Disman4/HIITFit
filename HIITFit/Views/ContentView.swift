import SwiftUI

struct ContentView: View {
  var body: some View {
      TabView{
          Text("Welcome")
          Text("Exersice 1")
          Text("Exersice 2")

      }
      .tabViewStyle(PageTabViewStyle())
      .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
