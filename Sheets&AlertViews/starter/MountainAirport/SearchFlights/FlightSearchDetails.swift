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

struct FlightSearchDetails: View {
  var flight: FlightInformation
  @Binding var showModel: Bool
  @State private var rebookAlert = false
  @EnvironmentObject var lastFlightInfo: AppEnvironment

  var body: some View {
    ZStack {
      Image("background-view")
        .resizable()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      VStack(alignment: .leading) {
        HStack {
          FlightDetailHeader(flight: flight)
          Spacer()
          Button("Close") {
            self.showModel = false
          }
        }
        // 1
        if flight.status == .canceled {
          // 2
          Button("Rebook Flight") {
            rebookAlert = true
          }
          
          
          // 3
          .alert(isPresented: $rebookAlert, content: {
            // 4
            Alert(title: Text("Contact Your Airline"), message: Text("We cannot rebook this flight. Please contact the airline to reschedule this flight"))
          })
        }
        FlightInfoPanel(flight: flight)
          .padding()
          .background(
            RoundedRectangle(cornerRadius: 20.0)
              .opacity(0.3)
          )
        Spacer()
      }.foregroundColor(.white)
      .padding()
    }.onAppear {
      lastFlightInfo.lastFlightId = flight.id
    }
  }
}

struct FlightSearchDetails_Previews: PreviewProvider {
  static var previews: some View {
    FlightSearchDetails(
      flight: FlightData.generateTestFlight(date: Date()), showModel: .constant(true)
    ).environmentObject(AppEnvironment())
  }
}
