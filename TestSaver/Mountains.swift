import ScreenSaver
import GameplayKit

class Mountains {
  var bounds: NSRect
  let random: GKLinearCongruentialRandomSource
  var peaks: [(position: CGFloat, height: CGFloat)]
  var positionOffset: CGFloat

  init(bounds: NSRect) {
    self.bounds = bounds
    self.random = GKLinearCongruentialRandomSource()
    self.peaks = [(position: CGFloat, height: CGFloat)]()
    self.positionOffset = 0
    initialize()
  }

  func initialize() {
    peaks = (0..<10).map { _ in
      let position = CGFloat(random.nextUniform()) * 300 + 100 + positionOffset
      let height = CGFloat(random.nextUniform()) * 300 + 100
      positionOffset += position

      return (position: position, height: height)
    }
  }

  func draw() {
    let tint = NSColor.green

    for peak in peaks {
      tint.withAlphaComponent(0.5).setFill()
      let path = NSBezierPath()
      path.move(to: CGPoint(x: peak.position + positionOffset, y: 0))
      path.line(to: CGPoint(x: peak.position + peak.height + positionOffset, y: peak.height))
      path.line(to: CGPoint(x: peak.position + peak.height * 2 + positionOffset, y: 0))
      path.fill()
    }
  }
}
