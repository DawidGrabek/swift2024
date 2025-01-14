//
//  GameRowView.swift
//  MasterAnd
//
//  Created by student on 07/01/2025.
//

import SwiftUI

struct GameRowView: View {
      var rowData: GameRowData
      var isClickable: Bool = true
      var onSelectColor: ((Int) -> Void)? = nil
      var onReverseSelectColor: ((Int) -> Void)? = nil
      var onCheck: (() -> Void)? = nil
      var isButtonClickable: Bool = false
  
      var body: some View {
          HStack(spacing: 8) {
              ForEach(rowData.selectedColors.indices, id: \..self) { index in
                  Circle()
                      .fill(rowData.selectedColors[index])
                      .frame(width: 40, height: 40)
                      .onTapGesture {
                          if isClickable {
                              onSelectColor?(index)
                          }
                      }
                      .onLongPressGesture {
                          if isClickable {
                              onReverseSelectColor?(index)
                          }
                      }
              }
  // feedback
              VStack(spacing: 4) {
                    ForEach(0..<2, id: \..self) { rowIndex in
                        HStack(spacing: 4) {
                            ForEach(0..<2, id: \..self) { columnIndex in
                                let feedbackIndex = rowIndex * 2 + columnIndex
                                if feedbackIndex < rowData.feedback.count {
                                    Circle()
                                        .fill(rowData.feedback[feedbackIndex])
                                        .frame(width: 20, height: 20)
                                }
                            }
                        }
                    }
                }
              if isClickable && isButtonClickable {
                  Button(action: { onCheck?() }) {
                      Image(systemName: "checkmark")
                          .foregroundColor(.white)
                          .padding()
                          .background(Color.blue)
                          .clipShape(Circle())
                  }
              }
          }
      }
  }


#Preview {
    GameRowView(
        rowData: GameRowData(
            selectedColors: [.red, .green, .blue, .yellow],
            feedback: [.green, .yellow, .gray, .gray]
        ),
        isClickable: true,
        onSelectColor: { index in
            print("Selected color at index: \(index)")
        },
        onCheck: {
            print("Check button tapped")
        }
    )
}
