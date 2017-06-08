import ScreenSaver

class MainView: ScreenSaverView {
//  var mountains = Mountains(bounds: CGRect.zero)
  var offset: CGFloat = 0;

  override init?(frame: NSRect, isPreview: Bool) {
    super.init(frame: frame, isPreview: isPreview)
    setup()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }

  func setup() {
    animationTimeInterval = 1 / 24
//    mountains.bounds = bounds
  }

  override func draw(_ rect: NSRect) {
    super.draw(rect)
    NSColor(calibratedRed:0.96, green:0.95, blue:0.93, alpha:1).setFill()
    NSRectFill(bounds)
//    mountains.draw()
  }

  override func animateOneFrame() {
    setNeedsDisplay(bounds)
    offset -= 1
//    mountains.draw()
  }
}
