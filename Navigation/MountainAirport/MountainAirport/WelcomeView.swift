/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct WelcomeView: View {
  @StateObject var flightInfo = FlightData()

  var body: some View {
    // 1
    NavigationView {
      ZStack(alignment: .topLeading) {
        // 2
        Image("welcome-background")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(height: 250)
        VStack(alignment: .leading) {
          // 3
          NavigationLink( // 4
            destination: FlightStatusBoard(flights: FlightData.generateTestFlights(date: Date()))
          ) {
            // 5
            WelcomeButtonView(title: "Flight Status", subTitle: "Departure and arrival information")
          }
          Spacer()
        }.font(.title)
        .foregroundColor(.white)
        .padding()
        // 6
      }
      .navigationTitle("Mountain Airport")
    }
    .navigationViewStyle(StackNavigationViewStyle())
    
    /*// 1
    NavigationView {
      //VStack(alignment: .leading) {
        ZStack(alignment: .topLeading) {
          // Background
          Image("welcome-background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 375, height: 250)
            .clipped()
          //Title
          VStack {
            Text("Mountain Airport")
              .font(.system(size: 28.0, weight: .bold))
            Text("Flight Status")
          }
          .foregroundColor(.white)
          .padding()
        }
        Spacer()
      //}.font(.title)
    }
    .navigationTitle("Mountain Airport")*/
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView()
  }
}
